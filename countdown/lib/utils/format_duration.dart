extension FormatDuration on Duration {
  String formatDuration() {
    return "${inDays}d ${inHours.remainder(24)}h "
        "${inMinutes.remainder(60)}m ${inSeconds.remainder(60)}s";
  }
}
