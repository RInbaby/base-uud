import 'dart:convert';
import 'dart:math';

import 'package:base_update_app/components/home/presentations/bloc/home_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/question_entities.dart';
import '../bloc/home_state.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeScreenScreenState();
}

class _HomeScreenScreenState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            // setState(() {
            //   _setListStatus();
            // });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: _buildMain(),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("HomePager"),
      actions: [
        InkWell(
            // onTap: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     return const CreateQuestionWidget();
            //   }));
            // },
            child: const Icon(Icons.add_circle_outline)),
      ],
      leading: InkWell(
          // onTap: () {
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //     return const SettingListItems();
          //   })).then((value) {
          //     if (value != null) {
          //       setState(() {
          //         _setListStatus();
          //       });
          //       // setState(() {
          //       //   listDisable = value;
          //       // });
          //     }
          //   });
          // },
          child: const Icon(Icons.settings)),
    );
  }

  Widget _buildMain() {

    return BlocBuilder(
      bloc: HomeBloc(),
      builder: (BuildContext context, HomeState state) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Questions ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              state.questions.isNotEmpty
                  ? Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.questions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: _itemQuestion(state.questions[index], index),
                            );
                          },
                        ),
                      ],
                    )
                  : const SizedBox(
                      child: Text("Không có dữ liệu nào, vui lòng thêm mới để hiển thị!"),
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _itemQuestion(QuestionEntities questionItem, int index) {
    return InkWell(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) {
      //     return DetailQuestionWidget(
      //       indexQuestion: index,
      //       questionItem: questionItem,
      //     );
      //   }));
      // },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black, spreadRadius: 1),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            const Icon(
              Icons.question_answer,
              color: Color(0xFF52AB78),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Câu hỏi số ${index + 1}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Text(questionItem.nameQuestion ?? ''),
              ],
            ),
            const Spacer(),
            const Icon(Icons.navigate_next_outlined),
          ],
        ),
      ),
    );
  }
}
