import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:redit_clone/core/constants/constants.dart';
import 'package:redit_clone/features/auth/controller/auth_controller.dart';
import 'package:redit_clone/features/community/repository/community_repository.dart';
import 'package:redit_clone/models/community_model.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/utils.dart';

//display user community provider
  final userCommunitiesProvider = StreamProvider((ref) {
  final communityController = ref.watch(communityControllerProvider.notifier);
  return communityController.getUserCommunities();
});

  // provider for getting community by name
  final getCommunityByNameProvider = StreamProvider.family((ref,String name)  {
    // we dont have name parameter so we use .family on stream provider
    return ref.watch(communityControllerProvider.notifier).getCommunityByName(name) ;
  });



final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepository = ref.watch(communityRepositoryProvider);
  return CommunityController(
      communityRepository: communityRepository, ref: ref);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref; // thsi is for to contact userProvider to get userId;
  CommunityController({
    required CommunityRepository communityRepository,
    required Ref ref,
  })  : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ??
        ''; // user null then show ''(empty string)
    CommunityModel communityModel = CommunityModel(
        id: name,
        name: name,
        banner: Constants.bannerDefault,
        avatar: Constants.avatarDefault,
        members: [uid],
        mods: [uid]);

    final result = await _communityRepository.createCommunity(communityModel);
    state = false;
    result.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Community created successfully');

      Routemaster.of(context).pop();
    });
  }



//display user community function

  Stream<List<CommunityModel>> getUserCommunities() {
    final uid = _ref.read(userProvider)!.uid;
    return _communityRepository.getUserCommunities(uid);
  }

 






  // function for getting community by name

  Stream<CommunityModel> getCommunityByName(String name) {
    return _communityRepository.getCommunityByName(name);

  }
}
