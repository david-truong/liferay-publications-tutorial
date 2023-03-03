# Publications Overview

## Lesson 1

Before we become engineers for a product, it is important we know how it currently works. We should also understand how our users intend to use the product.

In this lesson we will learn to:
- Enable Publications
- Create a Publication
- Add changes to a Publication
- Publish a Publication
- Review the history and revert
- Deal with conflicts

### Enable Publications
- Open App Menu
- Go to Publications
- Enable

Notice there is are few other options.
- Sandbox mode allows admins to force all content users to always work within a publication unless they have permissions to work on production.
- Allow Unapproved Publish allows assets to be published even if it has not been approved.

With publications enabled there are now two modes.  Production and Publication Mode.

Notice on the top bar it shows which mode you are in.

Let's move to the next part to enter Publication Mode

### Create a Publication
- Click on Top Bar
- Create a new publication

You are now in Publication Mode

### Add changes to a Publication
- Add a web content
- Modify Home page to add a button and change some text
- Click Top Bar -> Review changes
- Browse Individual Changes
- Got back to list of changes
- Click Show All Items
- Click into new changes
- Notice that there are now Parents and Children

Reviewing changes will by default show only the important changes relevant to users. Showing all items will also include all changes Liferay creates in the background. Notice that some have nice previews and others don't.  Eventually important changes should have a preview.

### Publish a Publication
- Click Publish

When publishing, you can publish immediately or instead you could have chosen to schedule the publication for a later date.

Before a publish takes place, two checks are performed. Checking for unapproved content and checking for conflicts. 

In this case both tests pass and we are able to publish.

### Review the history and revert
- Review the changes you just published
- Click Revert
- Click Later
- Delete the publication instead of publishing

Reverting a change is actually a new Publication with reverts.  We can either immediately publish the changes or add additional changes.  You can delete the revert as we would like to keep the changes.

### Deal with conflicts
- Create a publication
- Add a DL Folder with name: Test Folder
- Work on Production
- Add a DL Folder with name: Test Folder
- Go back to publication
- Attempt to publish

Notice that this time we have a conflict.  This is because Liferay does not allow you to have 2 folders with the same name.

Can you think of other areas where we might end up with a conflict?
