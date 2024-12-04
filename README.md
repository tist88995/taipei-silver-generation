# MGOV樣板專案請勿沿用此README

## 系統版本

* JAVA 1.8

* spring boot 2.4.8

* mgov 2.4.8.6

## 步驟

1. 將pom中<name> <artifactId>修改為自身專案名稱

2. 將src/main/java/com/tist/MgovTemplateApplication.java配合專案重新命名

3. 請依需求調整四份yml中參數

4. 請修改resources/templates/下目錄與yml中一致

5. 使用generate-ddl生成table後使用mgov-initializer進行基礎資料插入

