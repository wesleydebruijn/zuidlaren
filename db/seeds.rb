Event.create!([
  {name: "Nieuw pull request", action: "pullrequest:opened", event_group_id: 1},
  {name: "Toewijzing pull request", action: "pull_request:assigned", event_group_id: 1},
  {name: "Nieuw issue", action: "issues:opened", event_group_id: 1},
  {name: "Toewijzing issue", action: "issues:assigned", event_group_id: 1},
  {name: "Comment issue", action: "issue_comment", event_group_id: 1},
  {name: "Review pull request", action: "pull_request_review:submitted", event_group_id: 1},
  {name: "Review aanvraag pull request", action: "pull_request:review_requested", event_group_id: 1},
  {name: "Build (Jenkins) status", action: "status", event_group_id: 1}
])
EventGroup.create!([
  {name: "GitHub"}
])
Team.create!([
  {name: "Heisenbug", slack_channel: "zuidlaren"},
  {name: "Team One", slack_channel: "slackchannel"}
])
User.create!([
  {name: "Peter de Ridder", github_username: "DeRidder", slack_username: "peter", team_id: 1},
  {name: "Wesley de Bruijn", github_username: "wesleydebruijn", slack_username: "wesley", team_id: 1},
  {name: "Daniel Delnaaij", github_username: "delneet", slack_username: "danieldelnaaij", team_id: 1},
  {name: "Calvin Wong Loi Sing", github_username: "Jumba", slack_username: "cwongloising", team_id: 1}
])
