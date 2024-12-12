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
public enum SignType implements Encodable {

    登入("loginIn"),
    登出("loginOut");

    @NonNull
    private final String code;
}
