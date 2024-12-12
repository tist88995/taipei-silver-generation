package com.tist.domain.interface_package;

/**
 * 資料異動紀錄介面
 *
 * @author Torr
 */
public interface LogableEntity {

    /**
     * 需要紀錄資料的Entity都要覆寫此方法，
     * 此方法回傳值將會記錄在log中
     * 為了之後rollback方便，建議是Json格式
     *
     * @return 該Entity的紀錄字串
     */
    String toLog();

}
