package com.tist.service.impl;

import com.tist.annotation.PermissionControl;
import com.tist.bean.SimpleRequestMap;
import com.tist.bean.menu.Menu;
import com.tist.bean.menu.MenuItem;
import com.tist.bean.tree.Node;
import com.tist.domain.AccessRule;
import com.tist.domain.Program;
import com.tist.domain.Role;
import com.tist.domain.User;
import com.tist.repository.AccessRuleRepository;
import com.tist.repository.ProgramRepository;
import com.tist.repository.RoleRepository;
import com.tist.service.AccessRuleService;
import com.tist.service.ProgramService;
import com.tist.util.BeanTool;
import org.apache.commons.lang3.StringUtils;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Transactional
@Service("com.tist.service.impl.ProgramServiceImpl")
public class ProgramServiceImpl extends AbstractEntityServiceImpl<Program, ProgramRepository> implements ProgramService {

    private static final String[] EXCLUDE_PROPERTIES = new String[]{"id", "createUserId", "createTime", "children"};
    private static final List<Class<?>> FILTER_RETURN_TYPES;

    @Resource
    private AccessRuleRepository ruleRepository;
    @Resource
    private RoleRepository roleRepository;
    @Resource
    private AccessRuleService accessRuleService;

    public ProgramServiceImpl() {
    }

    public Program delete(Program target) {
        List<AccessRule> rules = this.ruleRepository.findAll("program", target);
        List<Role> roles = rules.stream().map(AccessRule::getRole).distinct().collect(Collectors.toList());
        if (!roles.isEmpty()) {
            roles.forEach((role) -> role.getAccessRules().removeAll(rules));
            this.roleRepository.saveAll(roles);
        }

        return super.delete(target);
    }

    public Program fetchAndUpdateBy(Program source) {
        if (null == source) {
            return null;
        } else {
            if (!BeanTool.isEmpty(source, "parent.id")) {
                String parentId = source.getParent().getId();
                Optional<Program> optionalParent = (this.getBaseRepository()).findById(parentId);
                if (optionalParent.isPresent()) {
                    source.setParent(optionalParent.get());
                } else {
                    if (!StringUtils.equals("root", parentId)) {
                        throw new RuntimeException(String.format("Program.parent.id(%s)不存在", parentId));
                    }

                    source.setParent(null);
                }
            } else {
                source.setParent(null);
            }

            // 編輯時，各種資料庫對於空字串處理方式不同，導致角色權限設置，使用url當連結的選單會無法勾選，統一設為null
            // oracle = null
            // sqlserver = ''
            // postgresql = ''
            if (StringUtils.isBlank(source.getController())) {
                source.setController(null);
            }

            if (StringUtils.isEmpty(source.getId())) {
                source.setId(null);
                return source;
            } else {
                return this.prepareMergedEntity(source, EXCLUDE_PROPERTIES);
            }
        }
    }

    public List<SimpleRequestMap> getRequestMappings(RequestMappingHandlerMapping handler) {
        Pattern adminPattern = Pattern.compile("(\\/admin\\/[\\w\\-]+)\\/([\\w\\-]+)");
        Map<RequestMappingInfo, HandlerMethod> methods = handler.getHandlerMethods();
        Map<String, SimpleRequestMap> map = new HashMap<>();
        Iterator<Map.Entry<RequestMappingInfo, HandlerMethod>> var5 = methods.entrySet().iterator();

        while (true) {
            HandlerMethod value;
            Class controller;
            PatternsRequestCondition condition;
            do {
                RequestMappingInfo key;
                Class returnType;
                do {
                    if (!var5.hasNext()) {
                        return new ArrayList<>(map.values());
                    }

                    Map.Entry<RequestMappingInfo, HandlerMethod> entry = var5.next();
                    key = entry.getKey();
                    value = entry.getValue();
                    controller = value.getBeanType();
                    returnType = value.getMethod().getReturnType();
                    if (value.getMethod().isAnnotationPresent(PermissionControl.class)) { // 有該標籤直接納入
                        break;
                    }
                } while (!FILTER_RETURN_TYPES.contains(returnType)); // 過濾回傳型別

                condition = key.getPatternsCondition();
            } while (condition == null);

            Set<String> patterns = condition.getPatterns();

            for (String pattern : patterns) {
                Matcher matcher = adminPattern.matcher(pattern);
                if ((matcher.find() && !value.getMethod().isAnnotationPresent(ResponseBody.class))
                        || value.getMethod().isAnnotationPresent(PermissionControl.class)) { // 判斷Annotation類型
                    String base = matcher.group(1);
                    String action = matcher.group(2);
                    SimpleRequestMap srm;
                    if (!map.containsKey(controller.getName())) {
                        srm = new SimpleRequestMap();
                        srm.setController(controller.getName());
                        srm.setBase(base);
                        srm.add(action);
                        map.put(controller.getName(), srm);
                    } else {
                        srm = map.get(controller.getName());
                        srm.add(action);
                    }
                }
            }
        }
    }

    public List<Node> findAllNodes() {
        return (this.getBaseRepository()).findAllNodes();
    }

    public List<Node> findRoleAllNodes(Role role) {
        List<Node> nodes = new ArrayList<>();
        List<Object[]> infos = (this.getBaseRepository()).findNodeInfosByRole(role.getId());
        String preProgramId = "";
        Map<String, Boolean> parentSelecteds = new HashMap<>();
        Iterator<Object[]> var6 = infos.iterator();

        Object[] data;
        String programId;
        String programParent;
        while (var6.hasNext()) {
            data = var6.next();
            programId = (String) data[0];
            programParent = null != data[1] ? (String) data[1] : null;
            boolean selected = (Boolean) data[5];
            if (!StringUtils.isEmpty(programId) && !StringUtils.isEmpty(programParent) && !selected) {
                parentSelecteds.put(programParent, false);
            }
        }

        for (var6 = infos.iterator(); var6.hasNext(); preProgramId = programId) {
            data = var6.next();
            programId = (String) data[0];
            programParent = null != data[1] ? (String) data[1] : null;
            String name = (String) data[2];
            String icon = (String) data[3];
            String action = null != data[4] ? (String) data[4] : null;
            String id = action != null ? programId + "_" + action : programId;
            String parent = action != null ? programId : programParent;
            String text = action != null ? actionTranslate(action) : name;
            boolean selected = parentSelecteds.containsKey(programId) ? parentSelecteds.get(programId) : (Boolean) data[5];
            Node node;
            if (!StringUtils.equals(preProgramId, programId) && !StringUtils.isEmpty(action)) {
                node = new Node(programId, programParent, name, icon);
                nodes.add(node);
            }

            if (action != null) {
                icon = "flag";
            }

            node = new Node(id, parent, text, icon);
            node.getState().setSelected(selected);
            nodes.add(node);
        }

        return nodes;
    }

    // Todo 未來如頻繁更改，考慮寫成設定檔來做翻譯
    public String actionTranslate(String englishAction) {
        switch (englishAction) {
            case "index":
                return "首頁";
            case "add":
                return "新增";
            case "delete":
                return "刪除";
            case "update":
                return "編輯";
            case "export":
                return "匯出";
            case "import":
                return "匯入";
            case "rule":
                return "選單設定";
            case "copy":
                return "複製";
            default:
                return englishAction;
        }
    }

    public List<Node> findRoleAllNodes(Role role, Collection<Role> allows) {
        List<Node> nodes = this.findRoleAllNodes(role);
        List<String> allowIds = this.accessRuleService.findValidNodeIdsByRoles(allows);
        Map<String, Boolean> idMap = allowIds.stream().collect(Collectors.toMap((id) -> id, (id) -> true));
        Set<String> disableParents = new TreeSet<>();
        nodes.forEach((node) -> {
            if (!idMap.containsKey(node.getId())) {
                node.getState().setDisabled(true);
                if (!StringUtils.isEmpty(node.getParent())) {
                    disableParents.add(node.getParent());
                }
            }

        });
        nodes.stream().filter((node) -> disableParents.contains(node.getId())).forEach((node) -> node.getState().setDisabled(true));
        return nodes;
    }

    @Cacheable(
            cacheNames = {"menus"},
            key = "#user.id",
            sync = true
    )
    public List<Menu> findMenus(User user) {
        List<Object[]> infos = (this.getBaseRepository()).findMenusByUserId(user.getId());
        Map<String, Menu> map = new LinkedHashMap<>();
        Iterator<Object[]> var6 = infos.iterator();

        Menu menu;
        Object[] info;
        String programId;
        String parent;
        String name;
        String icon;
        String url;
        String largeIcon;
        while (var6.hasNext()) {
            info = var6.next();
            parent = null != info[0] ? (String) info[0] : null;
            name = null != info[1] ? (String) info[1] : null;
            icon = null != info[2] ? (String) info[2] : null;
            url = null != info[3] ? (String) info[3] : null;
            largeIcon = null != info[4] ? (String) info[4] : null;
            if (StringUtils.isEmpty(name)) {
                menu = new Menu();
                menu.setIcon(url);
                menu.setLargeIcon(largeIcon);
                menu.setLabel(icon);
                menu.setUrl(largeIcon);
                map.put(parent, menu);
            }
        }

        var6 = infos.iterator();

        while (var6.hasNext()) {
            info = var6.next();
            programId = null != info[0] ? (String) info[0] : null;
            parent = null != info[1] ? (String) info[1] : null;
            name = null != info[2] ? (String) info[2] : null;
            icon = null != info[3] ? (String) info[3] : null;
            url = null != info[4] ? (String) info[4] : null;
            largeIcon = null != info[6] ? (String) info[6] : null;
            if (!StringUtils.isEmpty(parent)) {
                menu = map.get(parent);
                if (null != menu) {
                    MenuItem item = new MenuItem();
                    item.setIcon(icon);
                    if (!StringUtils.isEmpty(largeIcon)) {
                        item.setLargeIcon(largeIcon);
                    }
                    item.setLabel(name);
                    item.setUrl(url);
                    item.setActions(getBaseRepository().findActiveUrls(user.getUserId(), programId));
                    menu.getChildren().add(item);
                }
            }
        }

        return new ArrayList<>(map.values());
    }

    public List<String> findActiveUrlPatterns() {
        Pattern indexPattern = Pattern.compile("(\\/admin\\/[\\w\\-]+)\\/index");
        List<String> patterns = (this.getBaseRepository()).findActiveUrlPatterns();
        return patterns.stream().flatMap((pattern) -> {
            List<String> newPatterns = new ArrayList();
            newPatterns.add(pattern + "(.*)?");
            Matcher matcher = indexPattern.matcher(pattern);
            if (matcher.find()) {
                newPatterns.add(StringUtils.left(pattern, pattern.length() - 6) + "(\\/|[\\?\\.]{1}.*)?");
            }

            return newPatterns.stream();
        }).distinct().sorted().collect(Collectors.toList());
    }

    public void setRuleRepository(final AccessRuleRepository ruleRepository) {
        this.ruleRepository = ruleRepository;
    }

    public void setRoleRepository(final RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public void setAccessRuleService(final AccessRuleService accessRuleService) {
        this.accessRuleService = accessRuleService;
    }

    static {
        FILTER_RETURN_TYPES = Arrays.asList(String.class, Void.TYPE, ResponseEntity.class);
    }
}