import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'src/tool.dart';

class InMemoryDataService extends MockClient {
  static final _initialTools = [
    {
      'id': 01,
      'name': '烧杯',
      'function': '盛放液体化学试剂，用作化学试剂的加热、溶解、混合、煮沸、熔融、蒸发浓缩、稀释及沉淀澄清。',
      'link':
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1593010497511&di=f7f077eb7bbbfd46df014fc8cf22ba97&imgtype=0&src=http%3A%2F%2Fstatic.grainger.cn%2Fproduct_images_new%2F1200%2F6E9%2F2017073141.jpg'
    },
    {
      'id': 02,
      'name': '试管',
      'function': '用作于少量试剂的反应容器，在常温或加热时（加热之前应该预热，不然试管容易爆裂。）使用',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/b21c8701a18b87d69a53cca8010828381f30fd70?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2U4MA==,xp_5,yp_5'
    },
    {
      'id': 03,
      'name': '广口瓶',
      'function': '用于盛放固体试剂的玻璃容器，用于存放试剂，瓶口内部磨砂，用于与瓶塞配合使用。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/38dbb6fd5266d016f082758f912bd40734fa35fa?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2U4MA==,xp_5,yp_5'
    },
    {
      'id': 04,
      'name': '细口瓶',
      'function':
          '用于存放液体试剂的玻璃容器，细口方便液体倾倒，并且能够避免试剂挥发，因此口比较小。有透明和棕色两种，棕色瓶用于盛放需避光保存的试剂。可以装固体(粉末状固体）。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/6a63f6246b600c33e07f376f1c4c510fd9f9a117?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxNTA=,xp_5,yp_5'
    },
    {
      'id': 05,
      'name': '滴管',
      'function': '吸取或加少量试剂，以及吸取上层清液，分离出沉淀。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/71cf3bc79f3df8dc1def4b1bc811728b4610286e?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UyNzI=,xp_5,yp_5'
    },
    {
      'id': 06,
      'name': '酒精灯',
      'function': '对其他实验材料低温加热。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/b8014a90f603738d79c115afb91bb051f919ecb0?x-bce-process=image/crop,x_0,y_158,w_640,h_422/watermark,g_7,image_d2F0ZXIvYmFpa2U4MA==,xp_5,yp_5'
    },
    {
      'id': 07,
      'name': '烧瓶',
      'function': '用来盛液体物质，试剂量较大而又有液体物质参加反应时使用的容器。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/eaf81a4c510fd9f9532adeed292dd42a2834a471?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2UxODA=,xp_5,yp_5'
    },
    {
      'id': 08,
      'name': '石棉网',
      'function': '加热液体时架在酒精灯上的三脚架上',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/2934349b033b5bb5c999411834d3d539b700bc8d?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2U4MA==,xp_5,yp_5'
    },
    {
      'id': 09,
      'name': '铁架台',
      'function': '配有上下移动、大小不同的铁环、铁夹、用以固定或放置反应器,加热冷凝。',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/314e251f95cad1c8093dc93e743e6709c93d5120?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2U5Mg==,xp_5,yp_5'
    },
    {
      'id': 10,
      'name': '药匙',
      'function': '用于取用粉末状或小颗粒状的固体试剂',
      'link':
          'https://bkimg.cdn.bcebos.com/pic/10dfa9ec8a13632728b82dee968fa0ec09fac792?x-bce-process=image/watermark,g_7,image_d2F0ZXIvYmFpa2U4MA==,xp_5,yp_5'
    }
  ];
  static List<Tool> _toolsDb;
  static int _nextId;
  static Future<Response> _handler(Request request) async {
    if (_toolsDb == null) resetDb();
    var data;
    switch (request.method) {
      case 'GET':
        final id = int.tryParse(request.url.pathSegments.last);
        if (id != null) {
          data = _toolsDb
              .firstWhere((tool) => tool.id == id); // throws if no match
        } else {
          String prefix = request.url.queryParameters['name'] ?? '';
          final regExp = RegExp(prefix, caseSensitive: false);
          data = _toolsDb.where((tool) => tool.name.contains(regExp)).toList();
        }
        break;
      case 'POST':
        var function = json.decode(request.body)['funtion'];
        var link = json.decode(request.body)['link'];
        var name = json.decode(request.body)['name'];
        var newTool = Tool(_nextId++, name, function, link);
        _toolsDb.add(newTool);
        data = newTool;
        break;
      case 'PUT':
        var toolChanges = Tool.fromJson(json.decode(request.body));
        var targetTool = _toolsDb.firstWhere((h) => h.id == toolChanges.id);
        targetTool.name = toolChanges.name;
        targetTool.function = toolChanges.function;
        targetTool.link = toolChanges.link;
        data = targetTool;
        break;
      case 'DELETE':
        var id = int.parse(request.url.pathSegments.last);
        _toolsDb.removeWhere((tool) => tool.id == id);
        // No data, so leave it as null.
        break;
      default:
        throw 'Unimplemented HTTP method ${request.method}';
    }
    return Response(json.encode({'data': data}), 200,
        headers: {'content-type': 'application/json'});
  }

  static resetDb() {
    _toolsDb = _initialTools.map((json) => Tool.fromJson(json)).toList();
    _nextId = _toolsDb.map((tool) => tool.id).fold(0, max) + 1;
  }

  static String lookUpName(int id) =>
      _toolsDb.firstWhere((tool) => tool.id == id, orElse: null)?.name;
  InMemoryDataService() : super(_handler);
}
