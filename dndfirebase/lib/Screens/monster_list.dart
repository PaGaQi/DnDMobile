import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dndfirebase/Modals/firebase_data.dart';

List<String> titles = <String>[
  'List',
  'Favourites',
  'Homebrew',
];

void main() => runApp(const MonsterListBody());

class MonsterList extends StatelessWidget {
  const MonsterList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const MonsterListBody(),
    );
  }
}

class MonsterListBody extends StatelessWidget {
  const MonsterListBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;
    const String placeholderImg =
        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5Ojf/2wBDAQoKCg0MDRoPDxo3JR8lNzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzf/wAARCABAAEADASIAAhEBAxEB/8QAGwAAAQUBAQAAAAAAAAAAAAAABgECBAUHAwD/xAAxEAACAQMCBAQFAwUBAAAAAAABAgMEBREAIQYSMUETUWFxFCIykaEHFoEjJFJisdH/xAAZAQACAwEAAAAAAAAAAAAAAAAABAECAwX/xAAgEQACAgICAgMAAAAAAAAAAAAAAQIRAyESMQQiE0Fh/9oADAMBAAIRAxEAPwDUplYhu/l21AqIzK22RjrnXW6XWgtZU3Guhpg30rJIFLY8h31X0vEdmuFZ8HQ3CKpnaMuFjy2QOvzdM+mddGE6HoyojzoQrY8+uoiSRyNypIjMPqAYEjUDjZambhuu8BmVlw7AbEoCOYfb8DQJYIbZJaqqWKZ6W80qPNHJ4hUMFGdgNjsMEY028rjLjQw8ji6NKPTfTo/cBTtk6B7VxjdayaKnS2pVSAASGMkMf9j2X/mjCprKSlI+KqoYARkeLIE/6dawyxmrRpHJGS0TVk+QgHvpyE/VkH5dtV8F2t1Qyx01wpZJG2VFmUk+wzqZE/KoGMe+p01oNPobxtwfDxBVrWU9UaesjjCZccyOoyQMdQck7j7aCl4m4gtVxmoBDQ1dbCTG0i0pLsAMkArykj3HbOjvjq6VdBSQ0dqOLpXSiOnCgFgBuxwdh2Ge2fTQDcL4s1DKlyiji4kt0y+HWcpVpeRtwSo+rbG+xHlrkOl0c50uhx/UWuYP8Rb6ZnxgFWZQD6g5z9xoHY8zFsAZOcAYA9hrpUzST1Es8x5pJXLu3mScnXLUuTl2wcm+ywob1c6Cmemoqt4YXJLKqr1PkSMj+NdbPLannlN/SqlMnSdJMlT6jqffJ9tVY17fRyYcmH3DcXCtDIZo7lDNNzZjeqHIY/YMBv66L4ailqpClNVwSuBzcscgYgeeAdZ3w7QcNVFAkl1qjHVFyrRyTci+hGMbY8z1zo5tVjtlqk8W30qI7rjxOYsSPQknb207hcq1VDeJutUWFjtlbLVVF8vkYFzmykcQYFaWLsq42yd8n/06HP1NtdtiozdD/Tr5ZFQcp2l23yPMAdfQa0aqRQS2eUDuT31lIp5ePr3NUM7w2uk+SPl+o58s7AnGT5DA0rSceK+xek40gAdsnSamXi21FpuEtHVgCROjL0YdiNQhvrOq0Z1Q7tr2k09EaRwifU2wz0GoAurJSUdVZ7zNNEz1NNCHi+YgKDnJwOuMd9HXA4b9sURMhckPjO+Bznb+NDvAVL4t5uFRBH/YCJohzdGywIGD12Bz7+ur602+vs14+HouV7LLzSHmYc0DY6DvgnH59y5gjSUkvwaxKqdBvWVKzrJC4BVwVbGRsdjoJ/YtmDsytWovZFmGMfbP50SysSzt1ydIjkrg5OBrVYY1tF/ijXQC8RcHUkdA72mFxUoefBdmMg7jc9fLQG6NE/JKrI3+LDB/OtvmQsuNMeKKQcs0SSL5MoI0ZPGjPcdBPBGW1oxNVaRgsal2PQKMk6J7JwZVV0cdRXSGlhbfw+U+IR7HZfz7aOXs9uNbT1Yo40ngB8MplQM56gbHqeo76nHY79NVx+Kk/bZWHjpP2FtlFS0FElLSQqkSdFHXPmT3On+GzMRgAeZ0iNg5B0+QYwVOcjpphKtI2SrSP//Z';

    return DefaultTabController(
        initialIndex: 1,
        length: tabsCount,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Monster List'),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
            backgroundColor: Color.fromARGB(255, 255, 22, 22),

            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            // The elevation value of the app bar when scroll view has
            // scrolled underneath the app bar.
            scrolledUnderElevation: 4.0,
            shadowColor: Theme.of(context).shadowColor,
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              dividerColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  icon: const Icon(Icons.list),
                  text: titles[0],
                ),
                Tab(
                  icon: const Icon(Icons.star),
                  text: titles[1],
                ),
                Tab(
                  icon: const Icon(Icons.home),
                  text: titles[2],
                ),
              ],
            ),
          ),
          body: StreamBuilder(
            stream: dbGetHomebrew(),
            builder: ((context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              List<Homebrew> currentHomebrew = snapshot.data!;
              return TabBarView(
                children: <Widget>[
                  ListView.builder(
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        tileColor: index.isOdd
                            ? Color.fromARGB(255, 255, 189, 89)
                            : Color.fromARGB(255, 252, 201, 126),
                        title: Text('${titles[0]} $index'),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        tileColor: index.isOdd
                            ? Color.fromARGB(255, 255, 189, 89)
                            : Color.fromARGB(255, 252, 201, 126),
                        title: Text('${titles[1]} $index'),
                      );
                    },
                  ),
                  ListView.builder(
                    itemCount: currentHomebrew.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: index.isOdd
                            ? Color.fromARGB(255, 255, 189, 89)
                            : Color.fromARGB(255, 252, 201, 126),
                        title: Text(currentHomebrew[index].name,
                            style: const TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        leading: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.network(placeholderImg)),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
