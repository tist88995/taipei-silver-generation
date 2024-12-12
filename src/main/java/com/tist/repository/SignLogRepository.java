package com.tist.repository;

import com.tist.domain.SignLog;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Map;

public interface SignLogRepository extends BaseRepository<SignLog, String> {

    Page<SignLog> findAll(Map<String, Object> conditions, Pageable pageable);
}
