package com.tist.service.impl;

import com.tist.domain.AbstractEntity_;
import com.tist.domain.SignLog;
import com.tist.repository.SignLogRepository;
import com.tist.service.SignLogService;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("com.tist.service.impl.SignLogServiceImpl")
@Transactional
@Slf4j
public class SignLogServiceImpl extends AbstractEntityServiceImpl<SignLog, SignLogRepository> implements SignLogService {

    private static final String[] EXCLUDE_PROPERTIES = new String[]{
            AbstractEntity_.ID,
            AbstractEntity_.CREATE_USER_ID,
            AbstractEntity_.CREATE_TIME
    };

    @Override
    public SignLog fetchAndUpdateBy(SignLog source) {
        if (null == source) {
            return null;
        }
        if (Strings.isBlank(source.getId())) {
            source.setId(null);
            return source;
        }
        return prepareMergedEntity(source, EXCLUDE_PROPERTIES);
    }

}
