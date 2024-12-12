package com.tist.repository;

import com.tist.bean.tree.Node;
import com.tist.domain.Program;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProgramRepository extends NodeRepository<Program, String> {

    @Query("SELECT NEW com.tist.bean.tree.Node(t.id,t.parent.id,t.name,t.icon) FROM Program t ORDER BY t.parent DESC ,t.sort ASC")
    List<Node> findAllNodes();

    @Query("SELECT t.id,t.parent.id,t.name,t.icon,a, " +
            "CASE WHEN p IS NOT NULL AND p.controller IS NULL THEN true " +
            "WHEN p IS NOT NULL AND a2 IS NULL THEN false " +
            "WHEN p IS NOT NULL AND a2 IS NOT NULL THEN VALUE(a2) " +
            "ELSE false END AS s " +
            "FROM Program t " +
            "LEFT JOIN t.actions a " +
            "LEFT JOIN t.rules r ON r.role.id= :roleId " +
            "LEFT JOIN r.program p " +
            "LEFT JOIN r.actions a2 ON KEY(a2) = a " +
            "ORDER BY t.parent DESC,t.sort ")
    List<Object[]> findNodeInfosByRole(@Param("roleId") String roleId);

    @Query("SELECT DISTINCT p.id,p.parent.id,p.name,p.icon,p.url,p.sort,p.largeIcon " +
            "FROM AccessRule t " +
            "INNER JOIN t.role r " +
            "INNER JOIN r.users u " +
            "INNER JOIN t.program p " +
            "WHERE u.id=:userId " +
            "AND (p.invisible = false OR p.invisible IS NULL) " +
            "AND (SIZE(t.actions) = 0 OR true MEMBER OF t.actions) " +
            "ORDER BY p.sort ASC")
    List<Object[]> findMenusByUserId(@Param("userId") String userId);

    @Query("SELECT CASE WHEN a IS NULL THEN t.url ELSE CONCAT(t.url,'/',a) END FROM Program t LEFT JOIN t.actions a WHERE (t.disabled = FALSE OR t.disabled IS NULL) AND t.url LIKE '/%'")
    List<String> findActiveUrlPatterns();

    @Query(value = "select concat(tp.url_, '/', tara.action_) " +
            "from tist_access_rule_action tara " +
            "inner join tist_access_rule tar on tar.id_ = tara.access_rule_id_ " +
            "inner join tist_program tp on tp.id_ = tar.program_id_ " +
            "inner join tist_role tr on tr.id_ = tar.role_id_ " +
            "inner join tist_user_role tur on tur.role_id_ = tr.id_ " +
            "inner join tist_user tu on tu.id_ = tur.user_id_ " +
            "where tu.user_id_ = :userId " +
            "and tp.id_ = :programId " +
            "and tara.enable_ = 1 " +
            "and (tp.invisible_ = 0 or tp.invisible_ is null) " +
            "and (tp.disabled_ = 0 or tp.disabled_ is null) ", nativeQuery = true)
    List<String> findActiveUrls(String userId, String programId);
}
