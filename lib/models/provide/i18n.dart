import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get about => "About";
  String get activityUppercase => "ACTIVITY";
  String get adjustTimeSpan => "Adjust time span";
  String get all => "All";
  String get appRepoFullName => "conghaonet/GitHao";
  String get appTitle => "Cobranza";
  String get author => "Author";
  String get authorEmail => "conghaonet@gmail.com";
  String get authorGithubLogin => "conghaonet";
  String get authorLocation => "Beijing, China";
  String get authorName => "Cong Hao";
  String get bestMatch => "Best match";
  String get chineseSimplified => "Chinese(Simplified)";
  String get chooseTheme => "Choose Theme";
  String get clearLanguage => "Clear language";
  String get closed => "Closed";
  String get commit => "Commit";
  String get commitsUppercase => "COMMITS";
  String get committed => "Committed";
  String get committer => "Committer";
  String get copyRepoUrl => "Copy repo URL";
  String get copyright => "Copyright © 2019 Conghaonet";
  String get created => "Created";
  String get email => "Email";
  String get empty => "Empty";
  String get english => "English";
  String get filesUppercase => "FILES";
  String get filterLanguages => "Filter languages";
  String get followers => "Followers";
  String get following => "Following";
  String get forkedToViewTheParentRepository => "Forked, to view the parent repository.";
  String get forks => "Forks";
  String get fullName => "Full name";
  String get infoUppercase => "INFO";
  String get issues => "Issues";
  String get language => "Language";
  String get license => "License";
  String get loadingMoreData => "Loading more data...";
  String get login => "Login";
  String get loginAccountHint => "GitHub username or email";
  String get loginPasswordHint => "Password";
  String get logout => "Logout";
  String get member => "Member";
  String get myRepos => "My repos";
  String get news => "News";
  String get noMoreData => "No more data";
  String get notYetPublishedToTheAppStore => "Not yet published to the App Store.";
  String get notifications => "Notifications";
  String get oopsWrong => "Oops wrong!";
  String get open => "Open";
  String get openInBrowser => "Open in browser";
  String get orgUppercase => "ORG";
  String get owner => "Owner";
  String get private => "Private";
  String get profile => "Profile";
  String get public => "Public";
  String get pushed => "Pushed";
  String get queryCanNotBeEmpty => "Query can not be empty!";
  String get rateOrCommentInMarket => "Rate or comment in market";
  String get refreshFailedCheckNetwork => "Refresh failed, please check your network connection.";
  String get repositories => "Repositories";
  String get search => "Search";
  String get searchHistory => "Search history";
  String get searchSortFollowers => "Followers";
  String get searchSortForks => "Forks";
  String get searchSortJoined => "Recently joined";
  String get searchSortRepositories => "Repositories";
  String get searchSortStars => "Stars";
  String get searchSortUpdated => "Updated";
  String get selectALanguage => "Select a language";
  String get settings => "Settings";
  String get share => "Share";
  String get shareText => "https://github.com/conghaonet/GitHao";
  String get shareToYourFriends => "Share to your friends";
  String get skip => "Skip";
  String get sort => "Sort";
  String get sourceCode => "Source code";
  String get starToSupportMe => "Star to support me";
  String get stargazers => "Stargazers";
  String get starredRepos => "Starred repos";
  String get starredUppercase => "STARRED";
  String get state => "State";
  String get systemDefault => "System Default";
  String get tapToRetry => "Toca para Recargar";
  String get thisFieldCanNotBeEmpty => "This field cannot be empty";
  String get thisMonth => "This month";
  String get thisWeek => "This week";
  String get today => "Today";
  String get trending => "Trending";
  String get type => "Type";
  String get unwatch => "Unwatch";
  String get unwatched => "Unwatched";
  String get updated => "Updated";
  String get userDataHasBeanRefreshed => "User data has been refreshed.";
  String get users => "Users";
  String get version => "Version";
  String get watch => "Watch";
  String get watched => "Watched";
  String get watchers => "Watchers";
  String createdAt(String dateTime) => "${dateTime}";
  String googlePlayAppUrl(String packageName) => "https://play.google.com/store/apps/details?id=$packageName";
  String pushedAt(String dateTime) => "Pushed at ${dateTime}";
  String updatedAt(String dateTime) => "Updated at ${dateTime}";
}

class $en extends S {
  const $en();
}

class $zh_CN extends S {
  const $zh_CN();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get trending => "趋势";
  @override
  String get copyright => "版权 © 2019 Conghaonet";
  @override
  String get activityUppercase => "活动";
  @override
  String get about => "关于";
  @override
  String get commit => "Commit";
  @override
  String get refreshFailedCheckNetwork => "刷新失败，请检查您的网络连接。";
  @override
  String get infoUppercase => "信息";
  @override
  String get type => "类型";
  @override
  String get issues => "问题";
  @override
  String get selectALanguage => "选择一种语言";
  @override
  String get systemDefault => "系统默认";
  @override
  String get filesUppercase => "文件";
  @override
  String get sourceCode => "源代码";
  @override
  String get logout => "登出";
  @override
  String get commitsUppercase => "提交";
  @override
  String get clearLanguage => "清楚语言";
  @override
  String get english => "英语";
  @override
  String get shareText => "https://github.com/conghaonet/GitHao";
  @override
  String get thisMonth => "本月";
  @override
  String get state => "状态";
  @override
  String get forkedToViewTheParentRepository => "Forked 查看父版本库";
  @override
  String get forks => "版本库分支";
  @override
  String get profile => "用户资料";
  @override
  String get userDataHasBeanRefreshed => "用户数据已刷新";
  @override
  String get loginAccountHint => "GitHub用户名或邮箱";
  @override
  String get searchSortUpdated => "更新时间";
  @override
  String get version => "版本";
  @override
  String get starToSupportMe => "星标以支持作者";
  @override
  String get adjustTimeSpan => "调整时间跨度";
  @override
  String get authorName => "Cong Hao";
  @override
  String get following => "跟随";
  @override
  String get notifications => "通知";
  @override
  String get watchers => "观察者";
  @override
  String get skip => "跳过";
  @override
  String get appTitle => "GitHao";
  @override
  String get login => "登录";
  @override
  String get search => "搜索";
  @override
  String get thisFieldCanNotBeEmpty => "该字段不可为空";
  @override
  String get member => "成员";
  @override
  String get searchSortForks => "分支数";
  @override
  String get searchSortFollowers => "跟随者数";
  @override
  String get share => "分享";
  @override
  String get notYetPublishedToTheAppStore => "尚未发布到 App Store";
  @override
  String get email => "邮箱";
  @override
  String get orgUppercase => "组织";
  @override
  String get committed => "提交于";
  @override
  String get stargazers => "星标";
  @override
  String get watch => "订阅";
  @override
  String get copyRepoUrl => "拷贝版本库URL";
  @override
  String get closed => "关闭的";
  @override
  String get searchHistory => "搜索历史";
  @override
  String get open => "开放的";
  @override
  String get unwatch => "取消订阅";
  @override
  String get noMoreData => "没有更多数据";
  @override
  String get thisWeek => "本周";
  @override
  String get filterLanguages => "筛选语言";
  @override
  String get language => "语言";
  @override
  String get loadingMoreData => "加载更多数据...";
  @override
  String get searchSortRepositories => "版本库数";
  @override
  String get empty => "Empty";
  @override
  String get chineseSimplified => "中文简体";
  @override
  String get bestMatch => "最佳匹配";
  @override
  String get committer => "提交者";
  @override
  String get repositories => "版本库";
  @override
  String get appRepoFullName => "conghaonet/GitHao";
  @override
  String get all => "全部";
  @override
  String get settings => "设置";
  @override
  String get created => "创建";
  @override
  String get author => "作者";
  @override
  String get tapToRetry => "点击重试";
  @override
  String get sort => "排序";
  @override
  String get rateOrCommentInMarket => "在应用市场中评分或评论";
  @override
  String get starredRepos => "星标版本库";
  @override
  String get shareToYourFriends => "分享给朋友";
  @override
  String get users => "用户";
  @override
  String get authorLocation => "北京, 中国";
  @override
  String get license => "许可";
  @override
  String get watched => "已订阅";
  @override
  String get starredUppercase => "评星";
  @override
  String get followers => "跟随者";
  @override
  String get searchSortStars => "星标数";
  @override
  String get queryCanNotBeEmpty => "请输入搜索关键字!";
  @override
  String get updated => "更新";
  @override
  String get myRepos => "我的版本库";
  @override
  String get authorEmail => "conghaonet@gmail.com";
  @override
  String get private => "私有的";
  @override
  String get loginPasswordHint => "密码";
  @override
  String get oopsWrong => "哎呀，出错啦！";
  @override
  String get unwatched => "已取消订阅";
  @override
  String get public => "公开的";
  @override
  String get openInBrowser => "在浏览器中打开";
  @override
  String get today => "今天";
  @override
  String get chooseTheme => "选择主题颜色";
  @override
  String get news => "新闻";
  @override
  String get owner => "自己的";
  @override
  String get authorGithubLogin => "conghaonet";
  @override
  String get fullName => "名称";
  @override
  String get searchSortJoined => "加入时间";
  @override
  String get pushed => "推送";
  @override
  String createdAt(String dateTime) => "创建于 ${dateTime}";
  @override
  String updatedAt(String dateTime) => "更新于 ${dateTime}";
  @override
  String pushedAt(String dateTime) => "推送于 ${dateTime}";
  @override
  String googlePlayAppUrl(String packageName) => "https://play.google.com/store/apps/details?id=$packageName";
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("es", "PE"),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        case "es_PE":
          S.current = const $zh_CN();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
