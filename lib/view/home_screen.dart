import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_services_module/view_model/service_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: buildAppBar(),
      ),
      body: buildBody(context: context),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      automaticallyImplyLeading: false,
      actionsPadding: EdgeInsets.only(right: 12),
      title: Padding(
        padding: EdgeInsets.only(top: 20),
        child: SizedBox(
          height: 80,
          width: double.infinity,
          child: buildSearchTextFormField(),
        ),
      ),
      actions: [
        CircleAvatar(
          radius: 23,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/icons/user_icon.png'),
        ),
      ],
    );
  }

  Widget buildSearchTextFormField() {
    return TextFormField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.surface,
        filled: true,
        hintText: 'Search "Punjabi Lyrics"',
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        prefixIcon: Icon(Icons.search, color: Colors.white),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 20,
              width: 1,
              color: Theme.of(context).colorScheme.tertiary,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
            Icon(Icons.mic, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget buildBody({required BuildContext context}) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final serviceViewModel = Provider.of<ServiceViewModel>(context);

    return SafeArea(
      child: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTopContainer(height: screenHeight * 0.32),
              SizedBox(height: 4),
              buildBottomContainer(serviceViewModel: serviceViewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopContainer({required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Text(
            'claim your',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 20),
          ),
          Text(
            'Free Demo',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontSize: 50),
          ),
          Text(
            'for custom Music Production',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 20),
          ),
          SizedBox(height: 16),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Transform.rotate(
                  angle: 6,
                  child: Image.asset(
                    'assets/icons/vinyl_disc_icon.png',
                    width: 70,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Book Now',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.rotate(
                  angle: 6,
                  child: Image.asset(
                    'assets/icons/synthesizer_icon.png',
                    width: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBottomContainer({required ServiceViewModel serviceViewModel}) {
    if (serviceViewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    if (serviceViewModel.services.isEmpty) {
      return Center(
        child: Text(
          'No music service is available at this momemt.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }
    if (serviceViewModel.errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          serviceViewModel.errorMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Hire hand-picked Pros for popular music services',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(fontSize: 18),
          ),
          SizedBox(height: 3),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            width: double.infinity,
            child: ListView.separated(
              itemCount: serviceViewModel.services.length,
              itemBuilder: (context, index) {
                final service = serviceViewModel.services[index];

                return ListTile(
                  onTap: () {
                    context.go('/simple_new_screen/${service.title}');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: Colors.white10.withValues(alpha: 0.1),
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 1, 10, 18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset(
                        service.assetPath,
                        width: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  title: Text(
                    service.title,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 18),
                  ),
                  subtitle: Text(
                    service.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 16),
                  ),
                  trailing: Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                  ),
                );
              },
              separatorBuilder:
                  (BuildContext context, index) => SizedBox(height: 3),
            ),
          ),
        ],
      ),
    );
  }
}
