# Publications Tutorial

## Lesson 3

In this lesson we will cover when to use CTCollectionThread.setSafeCloseable.

Change tracking an entity comprises of these parts:
- CTCollectionThread.setSafeCloseable
- CTAware

Run `gw deploy` to deploy the modules.

### When to use CTCollectionThread.setSafeCloseable

Similar to scopeGroupId and companyId, ctCollectionId is used to scope a transaction.  The ctCollectionId is actually a primary key to all tables that are change tracked like companyId.  For example, the primary key of BlogEntry is companyId, ctCollectionId, and blogEntryId combined.

As with other SafeCloseables, this allows you to switch the ctCollectionId temporarily to a different value.  Unlike other SafeClosaebles, you will not have to safe the old value and swap back after the SafeCloseable since the ctCollectionId value in CTThreadLocal is set automatically by CTCollectionSupplierImpl.

The most typical use case to temporarily change the value is to when a portlet lazily creates something in the background i.e temporary folders/preferences/templates on first use.  These things should be generated in Production to prevent them from being generated multiple times in different publications.

See: https://github.com/liferay/liferay-portal/blob/98e5acab478e706ac00dc87b6eaa9dc15efabc38/modules/apps/dynamic-data-mapping/dynamic-data-mapping-form-field-type/src/main/java/com/liferay/dynamic/data/mapping/form/field/type/internal/document/library/DocumentLibraryDDMFormFieldTemplateContextContributor.java#L182

Another use case would be when something is change tracked by you want to perform a specific action in production only.

See: https://github.com/liferay/liferay-portal/blob/f0deeeda8dce993a0d0ff04d347f30a7ab535cb2/modules/apps/users-admin/users-admin-web/src/main/java/com/liferay/users/admin/web/internal/portlet/MyAccountPortlet.java#L91

Once in awhile you will want to ensure that a file is generated in the right context since in Publications you are dealing with a mix of Production and Publication content. For example, a temporary folder is generated for a site for a portlet.  If the site is part of the publication, the folder needs to be part of the publication.  If the site is part of production, it should be generated in production.

See: https://github.com/liferay/liferay-portal/blob/44c4c0f53aab5e570555fb7177bd726692c82346/modules/apps/document-library/document-library-repository-portlet-file-repository-impl/src/main/java/com/liferay/document/library/repository/portlet/file/repository/internal/PortletFileRepositoryImpl.java#L290

In general SafeClosable are very easy to use and a very flexible tool to help make sure we are creating entities in the right context. But take note that while a SafeClosable can easily swap the value... there is nothing to prevent the value from being changed down the line.