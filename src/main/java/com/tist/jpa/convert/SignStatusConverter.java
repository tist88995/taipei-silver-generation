package com.tist.jpa.convert;

import com.tist.domain.enum_package.SignStatus;

import javax.persistence.Converter;

@Converter(autoApply = true)
public class SignStatusConverter extends EncodableAttributeConverter<SignStatus> {

    public SignStatusConverter() {
        super(SignStatus.class);
    }
}