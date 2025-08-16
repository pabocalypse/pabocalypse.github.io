---
layout:     post
title:      "Github Pages - Deployment Action"
date:       2025-08-16 14:32:00 +00:00
categories: github github-pages
tags:       github github-pages notes
---

If you are going to be deploying via github pages, and you want to use an
unsupported theme through the gem system (such as
[Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy)) then you'll want to
go through these settings on your repository.

1. Go to Settings.
1. Click on "Pages" in the left hand bar.
1. Change "Build and Deployment" -> "Source" from "Deploy from a branch" to
   "Github Actions".

![Github Actions](assets/images/posts/2025/5835d260c68040cd952b98c945a69604.jpg)
_Github Actions - Build and Deployment_

You can read more on this
[here](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow).

There is a second option, which will at least stop the workflow from failing
with the unsupported theme installed. This is still annoying though as it still
creates a workflow (build-pages-deployment) which will do nothing but eat up
some resources.

1. Go to a clone of your repository.
1. Create a file called `.nojekyll` in the location of where the github pages
   site gets generated from.
   * For pages like `account.github.io` this is usually in the root of the repo.
   * For project pages (code), this is usually in a folder called `docs`.
1. Commit, push, and get the file into the main branch.
