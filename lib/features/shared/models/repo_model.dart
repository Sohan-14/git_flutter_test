class RepoModel {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final bool private;
  final Owner owner;
  final String htmlUrl;
  final String? description;
  final bool fork;
  final String url;
  final String languagesUrl;
  final int stargazersCount;
  final int watchersCount;
  final String? language;
  final int forks;
  final int openIssues;
  final String defaultBranch;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;

  RepoModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.languagesUrl,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forks,
    required this.openIssues,
    required this.defaultBranch,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
  });

  factory RepoModel.fromJson(Map<String, dynamic> json) {
    return RepoModel(
      id: json['id'],
      nodeId: json['node_id'],
      name: json['name'],
      fullName: json['full_name'],
      private: json['private'],
      owner: Owner.fromJson(json['owner']),
      htmlUrl: json['html_url'],
      description: json['description'],
      fork: json['fork'],
      url: json['url'],
      languagesUrl: json['languages_url'],
      stargazersCount: json['stargazers_count'],
      watchersCount: json['watchers_count'],
      language: json['language'],
      forks: json['forks'],
      openIssues: json['open_issues'],
      defaultBranch: json['default_branch'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      pushedAt: DateTime.parse(json['pushed_at']),
    );
  }
}


class Owner {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String htmlUrl;
  final String reposUrl;
  final String type;
  final bool siteAdmin;

  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.reposUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      login: json['login'],
      id: json['id'],
      nodeId: json['node_id'],
      avatarUrl: json['avatar_url'],
      htmlUrl: json['html_url'],
      reposUrl: json['repos_url'],
      type: json['type'],
      siteAdmin: json['site_admin'],
    );
  }
}
