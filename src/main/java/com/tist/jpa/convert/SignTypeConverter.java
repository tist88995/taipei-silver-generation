package com.tist.jpa.convert;

import com.tist.domain.enum_package.SignType;

import javax.persistence.Converter;

@Converter(autoApply = true)
public class SignTypeConverter extends EncodableAttributeConverter<SignType> {

    public SignTypeConverter() {
        super(SignType.class);
    }
}