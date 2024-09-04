String timeAgo(String specifiedTimeString) {
  DateTime specifiedTime = DateTime.parse(specifiedTimeString).toUtc();

  DateTime currentTime = DateTime.now().toUtc();

  Duration difference = currentTime.difference(specifiedTime);

  if (difference.inDays > 1) {
    return '${difference.inDays} days ago';
  }else if (difference.inDays > 0) {
    return 'Yesterday';
  }else if (difference.inHours > 0) {
    return '${difference.inHours} hr. ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} min. ago';
  } else {
    return 'Just now';
  }
}
