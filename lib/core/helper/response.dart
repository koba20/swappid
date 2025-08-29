bool responseState(int? code) {
  if (code != null) {
    if (code >= 200 && code < 300) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}
