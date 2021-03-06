package com.routon.plcloud.admin.privilege.service;

import java.util.List;

import com.routon.plcloud.admin.privilege.model.TreeBean;
import com.routon.plcloud.common.UserProfile;
import com.routon.plcloud.common.model.Group;

public interface GroupService {

	public Long add(Group group, UserProfile optUser) throws Exception;

	public Long edit(Group group, UserProfile optUser);

	public int delete(String ids, UserProfile optUser) throws Exception;

	public Long move(Group group, UserProfile optUser);

	public List<TreeBean> getGroupTreeByUserId(Long opuserId,
			Group queryCondition, Long userId);

	public List<TreeBean> getGroupTreeByUserId(Long opuserId,
			Group queryCondition, Long userId, boolean onlyleafcheck);

	public List<TreeBean> getGroupTreeByUserId(Long opuserId,
			Group queryCondition, Long userId, boolean onlyleafcheck,
			boolean showRelevanceCount);
}
