# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2020-08-05
### Added
- Before a user logs in they can only see the Log in/Sign up page.
- When they log in they have full access to the app.
- Users can post opinions.
- Users can follow other users.
- Users can unfollow other users.
- Users can add a profile photo and a profile cover image.
- Users upload the images while signing up.
- Statistics Page
- Follow option in the `Who to Follow` Tab.

### Fixed
- `Users#connect` only showing one image for all users. 
- `Users#show` only showing one image for all users. 
- Removed excess application logic in controllers. Implemented model methods.
- Safe params: Removed public `params[:attribute]`.
- Errors showing if you submit a blank registration form.
- Restful Routes: Allow only `opinion#create` and `opinion#show`.
- Asset Pipeline.