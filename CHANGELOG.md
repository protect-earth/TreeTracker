#  Tree Tracker

## 0.10.3
- Airtable integration is entirely replaced with Protect Earth custom API backend
- Removal of all redundant code
- Adoption of Resolver framework for dependency injection throughout
- Integration of Rollbar for error tracking and general telemetry so we can see how the app is behaving in the wild

## 0.7.0
- Updated the UI
- Added Tree Tracker (Mock server) scheme so it's easier to work with the app without having a full backend server created.
- Added entities preheating on first app launch (so you can go into the upload straight from the launch, you don't have to refresh the entities anymore).
- Added more granular database logging so it will be easier to debug with the log export function later on.
- Fixed progress lagging the UI being due to it called from backrgound thread (this might have not been noticed with not-so-big upload queue but it's good to fix regardless).
- Fixed a bug where we will always try to run database migration, even if not needed - though did didn't break anything, it was unnecessary calling db for a migration.

## 0.6.0
- Added "Recent Species" in the Species picker that shows Species selected that day.
- Added "Upload History" screen (from now on we will move trees added by this device to the History tab).
- Replaced "Tree list" screen with "Entities" screen.
- Replaced Secrets.xcconfig with Pouch config.

## 0.5.1
- Fixed a bug which, when you canceled saving details of a picture in live session, would freeze the camera view and you would need to kill the app. Now, when you cancel adding details to the image, we restart the camera picker since it seems like you cannot reuse the image again in the stock image picker.

## 0.5.0
- Added ability to cache images in sqlite & now we brought back trees in the list (though on hitting Refresh we don't fetch new ones to not flood the network with unnecessary requests for all trees in Airtable).
- Added landscape support for live camera session flow (it needed me to update the presentation mode of image picker, unfortunately).

## 0.4.0
- Fix changing/showing tabbar item name for queue (the idea was to hide names for now).
- Added new view for camera session flow (take a photo -> add details -> take another one...).
- Added rounding precision (5) for coordinates.
- Upload list is now sorted by `createdDate` if possible (descending).
- Sync button on All Trees view doesn't fetch trees from Airtable now + we don't show the trees for now since it takes lots of memory and network bandwith for no reason.

## 0.3.0
- When uploading, we will now disable screen lock timer and enable it back on after the upload finishes/errors out.
- Added delete all button to Upload Queue view - prompts with alert to confirm deleting all items from the queue and proceeds to do so when confirmed.

## 0.2.1
- Disabled longpress actions on textfields without caret (paste etc.)
- When adding a tree, add additional "--" field in keyboard picker when you don't want to select a Specie/Supervisor/Site yet.

## 0.2.0
- Added count of trees to upload on the list.
- Added ability to remove trees from the upload list (edit tree -> trash icon).
- Supervisors and Species now open a selection picker as a keyboard since we're using identifiers to other tables instead of pure strings for these fields.
- Added fetching of Supervisors/Species/Sites from Airtable tables once the app launches and it's refreshing with trees once Refresh button is tapped on List view. 
- Added Site to the edit/add tree modal (with selection picker and caching, similar to Supervisors/Species).
- Fixed progress bar & button state when image upload errored out.
- Fixed Save button glitch that would show loading spinner underneath the title.

## 0.1.0
- Upload queue that uploads an image on an image server (currently Cloudinary) and then creates a record on Airtable.
- Adding of images and filling the details like coordinates from the asset metadata (with option to add typed Supervisor/Species).
- List of all trees on the server (Uploaded Trees).
