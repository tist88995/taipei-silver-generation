package com.tist.domain.enum_package;

import com.tist.util.Encodable;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

/**
 * 登入結果
 *
 * @author JoeHsu
 */
@Getter
@RequiredArgsConstructor
public enum SignStatus implements Encodable {

    成功("success"),
    失敗("failed");

    @NonNull
    private final String code;
}
