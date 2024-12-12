package com.tist.web.admin;

import com.tist.annotation.PermissionControl;
import com.tist.annotation.ProgramInfo;
import com.tist.bean.QueryContext;
import com.tist.domain.CountryCode;
import com.tist.domain.CountryType;
import com.tist.domain.FileAttach;
import com.tist.service.CountryCodeImportService;
import com.tist.service.LocaleMessageService;
import com.tist.util.EnumUtils;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@ProgramInfo("SZ13030")
@Controller("adminCountryCodeController")
@RequestMapping({"/admin/country-code"})
public class CountryCodeController extends BaseCountryCodeController {

    private static final String VIEW_INDEX = "/admin/country-code/country-code-index";
    private static final String VIEW_INPUT = "/admin/country-code/country-code-input";
    private static final String VIEW_IMPORT = "/admin/country-code/country-code-import";
    private static final String REDIRECT_INDEX = "redirect:index";

    @Resource
    private CountryCodeImportService countryCodeImportService;
    @Resource
    private LocaleMessageService localeMessageService;
    private Map<String, CountryType> types = null;
    private Map<String, String> disables = null;
    private List<CountryCode> countryCodeList = null;

    public CountryCodeController() {
    }

    @ModelAttribute("types")
    public Map<String, CountryType> getTypes() {
        if (this.types == null) {
            this.types = EnumUtils.getMap(CountryType.class);
        }

        return this.types;
    }

    @ModelAttribute("disables")
    public Map<String, String> getDisables() {
        if (null == this.disables) {
            this.disables = new LinkedHashMap();
            this.disables.put("true", this.localeMessageService.getMessage("admin.config.disabled-yes"));
        }

        return this.disables;
    }

    @ModelAttribute("countryCodeList")
    public List<CountryCode> getCountryCodeList() {
        if (null == this.countryCodeList) {
            this.countryCodeList = this.countryCodeService.findByType(CountryType.縣市);
        }

        return this.countryCodeList;
    }

    @RequestMapping({"", "index"})
    public String index(@ModelAttribute("queryContext") QueryContext queryContext, Model model) {
        Page<CountryCode> page = this.countryCodeService.queryAll(queryContext);
        model.addAttribute("page", page);
        return VIEW_INDEX;
    }

    @GetMapping({"update/{id}"})
    public String update(@PathVariable("id") String id, Model model) {
        model.addAttribute("countryCode", this.countryCodeService.findOne(id));
        return VIEW_INPUT;
    }

    @PostMapping({"update"})
    public String doUpdate(@ModelAttribute("countryCode") @Valid CountryCode countryCode, BindingResult result) {
        if (!this.countryCodeService.findByIdNotAndCode(countryCode.getId(), countryCode.getCode()).isEmpty()) {
            result.rejectValue("code", "admin.error.code-already-exists");
        }

        if (result.hasErrors()) {
            return VIEW_INPUT;
        } else {
            this.countryCodeService.save(countryCode);
            return REDIRECT_INDEX;
        }
    }

    @GetMapping({"add"})
    public String add(CountryCode countryCode) {
        return VIEW_INPUT;
    }

    @PostMapping({"add"})
    public String save(@Valid CountryCode countryCode, BindingResult result) {
        if (!Objects.isNull(this.countryCodeService.findByCode(countryCode.getCode()))) {
            result.rejectValue("code", "admin.error.code-already-exists");
        }

        if (result.hasErrors()) {
            return VIEW_INPUT;
        } else {
            this.countryCodeService.save(countryCode);
            return REDIRECT_INDEX;
        }
    }

    @RequestMapping({"export"})
    @ResponseBody
    @PermissionControl
    public ResponseEntity<org.springframework.core.io.Resource> export(@ModelAttribute("queryContext") QueryContext queryContext) {
        if (null == queryContext) {
            queryContext = new QueryContext();
        }

        return this.countryCodeService.createExportResponseEntity(queryContext);
    }

    @GetMapping({"import"})
    public String showImport(Model model) {
        model.addAttribute("file", new FileAttach());
        return VIEW_IMPORT;
    }

    @PostMapping({"import"})
    public String importFile(@ModelAttribute("file") FileAttach file) throws IOException {
        File tmpFile = File.createTempFile("import", "xls");
        if (tmpFile.exists() && !tmpFile.delete()) {
            throw new RuntimeException("檔案刪除失敗 " + tmpFile.getAbsolutePath());
        } else {
            file.getFile().transferTo(tmpFile);
            this.countryCodeImportService.importFile(tmpFile);
            return VIEW_IMPORT;
        }
    }

    @PostMapping({"/findByParentId"})
    @ResponseBody
    public List<CountryCode> findByParentId(CountryCode countryCode) {
        return this.countryCodeService.findByParentId(countryCode.getParent().getId());
    }

    @GetMapping({"delete/{id}"})
    @ResponseBody
    @PermissionControl
    public boolean delete(@PathVariable("id") String id) {
        CountryCode target = (CountryCode) this.countryCodeService.delete(id);
        return target != null;
    }

    @PostMapping({"queryByCode"})
    @ResponseBody
    public List<CountryCode> queryByCode(@RequestParam(value = "code", required = false) String code) {
        return this.countryCodeService.findByParentCode(code);
    }
}
