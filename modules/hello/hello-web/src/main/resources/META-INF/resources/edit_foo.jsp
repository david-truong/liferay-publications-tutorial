<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/init.jsp" %>

<%
String redirect = ParamUtil.getString(request, "redirect");

long fooId = ParamUtil.getLong(request, "fooId");

Foo foo = null;

if (fooId > 0) {
	foo = fooLocalService.getFoo(fooId);
}
%>

<clay:container-fluid>
	<div class="card">
		<div class="card-body">
			<aui:form action="<%= (javax.portlet.ActionURL)renderResponse.createActionURL() %>" method="post" name="fm">
				<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= (foo == null) ? Constants.ADD : Constants.UPDATE %>" />
				<aui:input name="redirect" type="hidden" value="<%= currentURL %>" />
				<aui:input name="fooId" type="hidden" value="<%= fooId %>" />

				<liferay-ui:header
					backURL="<%= redirect %>"
					title='<%= (foo != null) ? foo.getField1() : "new-foo" %>'
				/>

				<liferay-asset:asset-categories-error />

				<liferay-asset:asset-tags-error />

				<aui:model-context bean="<%= foo %>" model="<%= Foo.class %>" />

				<aui:fieldset>
					<aui:input name="field1" />

					<aui:input name="field2" />

					<aui:input name="field3" />

					<aui:input name="field4" />

					<aui:input name="field5" />

					<liferay-expando:custom-attributes-available className="<%= Foo.class.getName() %>">
						<liferay-expando:custom-attribute-list
							className="<%= Foo.class.getName() %>"
							classPK="<%= (foo != null) ? foo.getFooId() : 0 %>"
							editable="<%= true %>"
							label="<%= true %>"
						/>
					</liferay-expando:custom-attributes-available>

					<aui:input name="categories" type="assetCategories" />

					<aui:input name="tags" type="assetTags" />
				</aui:fieldset>

				<aui:button-row>
					<aui:button type="submit" />

					<aui:button href="<%= redirect %>" type="cancel" />
				</aui:button-row>
			</aui:form>
		</div>
	</div>
</clay:container-fluid>