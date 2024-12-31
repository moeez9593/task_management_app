import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_management_app/constants/extension_constants.dart';
import 'package:task_management_app/model/project/project.dart';
import 'package:task_management_app/repository/database_repo.dart';
import 'package:uuid/uuid.dart';

class ProjectState {
  List<Project> projectList; 
  String projectId; 
  String projectTitle; 

  ProjectState({
    required this.projectList,
    required this.projectId, 
    required this.projectTitle
  });

  ProjectState copyWith({
    String? projectId,
    String? projectTitle, 
    List<Project>? projectList 
  }){
    return ProjectState(
      projectList: projectList??this.projectList,
      projectId: projectId ?? this.projectId, 
      projectTitle: projectTitle??this.projectTitle
      ); 
  }

  factory ProjectState.initial () {
    return ProjectState(projectList: [], projectId: '', projectTitle: '');
  }
}



class ProjectNotifier extends Notifier <ProjectState> {
  @override
  ProjectState build() {
    // TODO: implement build
   return ProjectState.initial(); 
  }

  void addProject () {
    var projectId = const Uuid().v4(); 
    final newProject = Project(projectId: projectId, projectTitle: state.projectTitle); 

    state = state.copyWith(projectList: [...state.projectList, newProject]); 
    AppDatabase().addProject(newProject.toCompanion());
  }


   void fetchAllProjects() async {
    final tasks = await AppDatabase().loadAllProjects();
    state = state.copyWith(projectList: tasks.toProjectList());
  }
  



}