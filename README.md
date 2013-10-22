# Description

One page Rails application that serves as my personal music pages. Features include:
- Music player that streams audio and pulls info from SoundCloud using SoundCloud's JavaScript API and [Custom Music Player](https://github.com/soundcloud/soundcloud-custom-player).
- News page that has blog posts. Posts can interpret raw HTML and can have an attached image though [Paperclip](https://github.com/thoughtbot/paperclip) and AWS.
- Signed in users can create, edit, and delete posts. Anyone can add a comment. Signed in users can delete them.
- Contact page that uses ActionMailer to send an email upon submission.

 The app is deployed to Heroku and can be found at [www.contextbeats.com](http://www.contextbeats.com).