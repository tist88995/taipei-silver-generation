package com.tist.domain.enum_package;

import com.tist.util.Encodable;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * 資料異動紀錄的選項
 *
 * @author Torr
 */
@Getter
@RequiredArgsConstructor
public enum LogableOperation implements Encodable {

    ALL("ALL"),
    INSERT("INSERT"),
    UPDATE("UPDATE"),
    DELETE("DELETE"),
    QUERY("QUERY");

    @NonNull
    private final String code;

}
