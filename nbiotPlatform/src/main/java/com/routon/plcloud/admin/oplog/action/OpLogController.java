package com.routon.plcloud.admin.oplog.action;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.routon.plcloud.admin.oplog.service.OpLogService;
import com.routon.plcloud.common.PagingBean;
import com.routon.plcloud.common.UserProfile;
import com.routon.plcloud.common.constant.SystemBuzFunctionModule;
import com.routon.plcloud.common.model.OpLog;

@Controller
@SessionAttributes(value = { "userPrivilege", "userProfile" })
public class OpLogController {
	
	private Logger logger = LoggerFactory.getLogger(OpLogController.class);
	
	private final String RMPATH = "/opLog/";
	
	@Autowired
	private OpLogService opLogServiceImpl;
	
	@Autowired
	private TaskService taskService;
	
	@RequestMapping(value = RMPATH + "list")
	public String list(HttpServletRequest request, OpLog queryCondition,
			@ModelAttribute("userProfile")
			UserProfile user, Model model, HttpSession session) {

		logger.debug("list");
		try {

			
			Long loginUserId = user.getCurrentUserId();
			
			String username = user.getCurrentUserRealName();
			
			List<Task> taskQuery = taskService.createTaskQuery().taskCandidateOrAssigned(username).list();

			int page = NumberUtils.toInt(request.getParameter("page"), 1);
			int pageSize = NumberUtils.toInt(request.getParameter("pageSize"),
					10);
			int startIndex = (page - 1) * pageSize;

			PagingBean<OpLog> pagingBean = opLogServiceImpl.paging(
					startIndex, pageSize, request.getParameter("sort"),
					request.getParameter("dir"), queryCondition, null, null,
					loginUserId,request.getParameter("exportflag") != null&&request.getParameter("exportflag").equals("true")?true:false);

			int maxpage = (int) Math.ceil(pagingBean.getTotalCount()
					/ (double) pageSize);
			if (pagingBean.getTotalCount() == 0) {
				maxpage = 0;
			}
	
	
			model.addAttribute("type", queryCondition.getType());
	
			if (StringUtils.isNotBlank(queryCondition.getStartDate_createTime())) {
				model.addAttribute("startDate_createTime", queryCondition.getStartDate_createTime());
			}
			if (StringUtils.isNotBlank(queryCondition.getEndDate_createTime())) {
				model.addAttribute("endDate_createTime", queryCondition.getEndDate_createTime());
			}
			

			
			
			model.addAttribute("opTypes",
					SystemBuzFunctionModule.SYS_BUZ_FUNCTION_MODULE_MAP);
			
			model.addAttribute("maxpage", maxpage);
			model.addAttribute("page", page);
			model.addAttribute("List", taskQuery);
			model.addAttribute("pageList", pagingBean);

			// addCatalogAttribute(catalogId, model);
		}
		catch (Exception e) {
			logger.error("错误", e);
		}

		return "oplog/list";
	}
}
