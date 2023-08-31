class CallModel {
  String? callerId; // ID of the caller
  String? receiverId; // ID of the receiver
  String? status; // Call status (e.g., initiated, ongoing, ended)

  CallModel({
    this.callerId,
    this.receiverId,
    this.status,
  });

  CallModel.fromJson(Map<String, dynamic> json) {
    callerId = json['callerId'];
    receiverId = json['receiverId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['callerId'] = this.callerId;
    data['receiverId'] = this.receiverId;
    data['status'] = this.status;
    return data;
  }
}
