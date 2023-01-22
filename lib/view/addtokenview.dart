
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../modelview/token.dart';
import '../modelview/chatgptbloc.dart';

class AddTokenView extends StatelessWidget {
  AddTokenView({super.key, required this.sessionController, required this.clearanceController});

  final TextEditingController sessionController;
  final TextEditingController clearanceController;

  late double width;
  late double height;


  Widget field({TextEditingController? controller, required String theme}){
    return SizedBox(
      width: width * 0.7,
      child: TextField(
        style: const TextStyle(
          fontFamily: "Ubuntu",
          color: Colors.white,
        ),
        controller: controller,
        cursorColor: const Color(0xff7dba7a),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffff7bff))),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xffff7bff))),
          label: Text(
            "$theme Token",
            style: const TextStyle(
              fontFamily: "Ubuntu",
              color: Color(0xff7dba7a)
            )
          )
        ),
      )
    );
  }

  Future wrongTokenPopup ({required BuildContext context}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Wrong tokens",
            style: TextStyle(
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              color: Color(0xff7dba7a)
            )
          ),
          backgroundColor: const Color(0xFF1a1a1a),
          content: const Text(
            "One of your two tokens isn't valid, please try again",
            style: TextStyle(
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              color: Color(0xffff7bff)
            )
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
               "Ok",
                style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontWeight: FontWeight.bold,
                  color: Color(0xffff7bff)
                )
              )
            )
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    sessionController.text = "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..D_5hX2ReK-rvdIwN.abUjjQAhOR7AOv9kQigWb4DMnpBp5lWkB0uDbi3dW6BSbYNQ2kqCqQvVuWt5u9QQQ76qNBVqBCOqEy0aDskT7yHIUDCyTCEQEg0gJmoHOzRK9Y58BJjYDV4HlXTgPQkIl5qCHSlX3WHeaeJwfzQ_oRm5uDA-f67woe8vJ8gjxLBmXgv3_U6G9Zz0yW-sl9vXzM-wGhbpm_9_iasOHk9H9w-WujP8sb5aZcCBMczZwfbm-Wj5HpddpnPD1qc6GftICigyg6FBeUe9wYSW6NvywGfUgIn5fbE-XLKg9DGjIFKLxCMWDnPMjwQUjzNlnLkVYr5xNfxXxnKQqM0rkqpRwnY2apBwxmvKeTo6J_6V21QWznO-lqYZetMT-0pqd9mO1_DlU8ec5VfTf3QnW9n2Rjbpo3_Z-MzgFKaVKkyPz50PTgCGD8BloeAwTrxhYByq1y-tR4D-toJOv82IDvC2LXpG-lvOAyin4HU0uAGub6Y5KVdxGDsJN5pXBt6s3cpUqXS-Bax33PncgzcivWo8JKi4nsPw0T6YpX5ucCGR-SGw9ZDnHEhHBugk1jsuqY8u9BptGeE4zmHwNAhzgqJjdbvpqqXyUg1bLaQrOc38S6PouPBR4hJ6VOgnQUjA6uzZDoyB5XTLZkcuDxuC8D8elrpEQrLo4bq4m2Qtzvfeq4OKkiGYLkMnBvAjao36f4XVurkfKIc_On927ww1zjrp5kexN_HrS9ZBDy6vigOpkd04MvExh2_N3WLWA1p5qSR6vM-xJvPAC4oTBVM-WqNVjqL8i1-HHnR4UGNEUPIqkigM2pdctJs4qexjEOBhYbNm9rM8UbySygKX6OaUFCS9hFR7SO90DnkGuEx3pZ44ell_hDmFUiK5X7CmRCR8e7i9VrAu2Ww652yOqcpvqnTtNqXlQ-U0MGUpfHCKRgpuAjojRUFY9UUVTGfeWs1aZ6--8SQT-AAuqYLWML-lRQvVPzu21jvIucx7CTfNIh24uIY2qpaWus7BbmplMY19GbmzxVUHkks4MdrXMzKdR59QZBqXQHJk07tVdK4fvXBo5DqsGUhZnFE3JQru5MeygoCO_ljPBI7AU5NPTg1CJxaT2wXQ1XWHZn956RPgmcmnJh9cnGQUhkO5wlEUG6ZAXmiqRYfMvPLr_VKWcFUctP7lInSr_ejaKlkviAIe4ng-0gtbCE-HXoMeSj-D00jy2Ffk5IlzaZStyDjQITvkm9jZQUGJlN-zw-6_qljCLv_uyppKnz7XhI5DvL1hAM_IojIayOv548pNEaqOcZJqUfBIlRp_2DNLw0ZmF6jYe0G8FoHm6Pab1tz5dpUZKFTGFSpu2c7-C-rAP2EWdD1HfK37x3veaK9Uk5xFqh5FGEmHzZUkUkd_-dJrabaLrQgJdUHc--HsYw81B8EQd4-QC2Z0MeQkXS9TKapmN3e_7hsKiATk5JNcGfsKjhA0NG9lh8WBlnyKqrnI9LhFr4qoeo3e3v4LXigFl7zSOFzoIsJ75nF84rr8i_s3sKG6skIxUOx-U13CN1iY0eqy20exJIqJH37lQueqL8jmGcU54P-uxUPhOANKfpU1-6c1uqUjb1sJYEB9mLMo_jQmcQXuqBeNAOAu4wann3WKJDbiWU9EQe6j3Whsgx6fvDzAcTGBAA-rVb00wfIc5zEHsDjmd_rsMd1UYp4I7o_tQm7jdS1eRpSbGLxyz-kY1GtZbj8Kt6CL46TxXgtXBbV3ZTWPLolgv3zIYQhYm-lA98SSJZZmjQ4jv10aAZK0BA42lKOiZiApp7-SjS3IOO8o7FlgapNk4LjDWk0X41uXA3IAIyuMtMLKM5D4wB1TS732wurAr6M5grwgBMv0p1eY0I_Wjy8cDYdYQOJ44_rq5A-9fA7pLfKUb2dWWMhLWZh3TiUmRCk-6dZAgM4wiYKJBLuWrcMASkkK2CahbQ9Hfc6Fc9Sgmv1IzlVz-mTNaZnbBSJnzfM2dwvtCBgvtUtFKG6VGoetRsd_Yz8xqm3UAZppflbQfSbfUnMSYg9nb990-nnTUdRBbfKtDgJGmCqOe9S7ewxw_KSYNL4XGBxQRtVbB-yZFUeYba3z9Y5YC76QyV0RZRV55BK7_dsZQQM7xJcpLJYmj_XUGyVayfain3bB8NAeiqJGcn7BnJF8sQ52JrsgRA_rpKGH8OOSx90Ige1Gw3UD5hROtJJlAJC0PW4Fa6-xWZdEb03qMHtTjJQYibxGXoUjPlxtvXlNTe6VksIuT5_n.ynRb5RqQNZTDX6pUCi9xIw";
    clearanceController.text = "K2RAjyYIBLPWYkK7C4JriUs7PFoWDXV9TrSsAPVxf_Q-1674423640-0-1-23bcf394.ec4f24a5.c4ce6184-250";

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Center(
          child: Text(
            "Chat Token",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              color: Color(0xffff7bff)
            ),
          )
        ),
        field(controller: sessionController, theme: "Session"),
        field(controller: clearanceController, theme: "Clearance"),
        TextButton(
          onPressed: () async {
            String session = sessionController.text;
            String clearance = clearanceController.text;

            if(session.isNotEmpty && clearance.isNotEmpty) {
              try {
                var api = ChatGPTApi(
                  sessionToken: session,
                  clearanceToken: clearance
                );

                var msg = await api.sendMessage(
                  ""
                );

                var tokenBox = await Hive.openBox("token").then((tokenBox) {
                  tokenBox.put("token", session);
                  tokenBox.put("clearance", clearance);

                  Token token = Token(session: session, clearance: clearance);
                  BlocProvider.of<ChatGptBloc>(context).add(ChangeTokenEvent(token: token));
                });

              } catch(e) {
                print(e);
                await wrongTokenPopup(context: context).whenComplete(() => null);
              }
            }
          },
          child: const Text(
            "add",
            style: TextStyle(
              fontSize: 25,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.bold,
              color: Color(0xffff7bff)
            )
          )
        )
      ]
    );
  }
}
