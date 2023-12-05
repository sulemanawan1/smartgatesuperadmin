class NoticeBoard {
  final int? id;
  final int? subadminid;

  final String? noticetitle;
  final String? noticedetail;
  final String? startdate;
  final String? enddate;
  final String? createdAt;

  final String? starttime;
  final String? endtime;
  final int? status;

  NoticeBoard(
      {this.id,
      this.subadminid,
      this.noticetitle,
      this.noticedetail,
      this.startdate,
      this.enddate,
      this.starttime,
      this.endtime,
      this.status,
      this.createdAt});
}
