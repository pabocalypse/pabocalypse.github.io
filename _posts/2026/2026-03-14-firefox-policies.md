---
layout: post
title: "Managing Firefox Preferences"
date: 2026-03-15 09:34 +00:00
categories: tech-tips
tags: firefox
---

So in order to get Firefox to behave as I wanted across different machines,
rather than changing the settings on all of them to be the same, I modify the
`policies.json` file and store that in an ansible configuration. The start of
this was just to disable Pocket, and hide it in the browser as it was a service
that I did not use. This has eventually lead to more and more things being added
such as disabling Generative AI, disabling saving of passwords (I use Bitwarden
as a password manager), etc... This has lead me to have a better overall
experience when using Firefox.

For this we use the `to_nice_json` on the variable where we store the data. You
can read more on the `policy.json` file
[here](https://mozilla.github.io/policy-templates/). You may also need to create
the `/etc/firefox/policies` directory with correct ownership as well.

```yaml
- name: Firefox Policies File
  ansible.builtin.copy:
    content: "{{ firefox_policies | to_nice_json }}"
    dest: /etc/firefox/policies/policies.json
    owner: root
    group: root
    mode: u=rw,g=rw,o=r
  become: true
  vars:
    firefox_policies:
      policies:
        DisablePocket: true
        DisableTelemetry: true
        OfferToSaveLogins: false
        StartDownloadsInTempDirectory: true
        FirefoxHome:
          Pocket: false
          Search: true
          TopSites: true
          SponsoredTopSites: false
          SponsoredPocket: false
          Highlights: false
          Snippets: false
          Locked: true
        GenerativeAI:
          Enabled: false
          Chatbot: false
          LinkPreviews: false
          TabGroups: false
          Locked: true
```

Under a `Preferences` option, you are also able to tweak some values that you
would find via `about:config`. Some of the specific items I have there are:

* `browser.aboutConfig.showWarning` -> Set to false
* `browser.aboutwelcome.enabled` -> Set to false
* `browser.tabs.groups.enabled` -> Set to true
