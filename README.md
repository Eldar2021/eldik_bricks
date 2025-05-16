# Eldik mason Bricks

This repository contains custom mason bricks for Eldik mobile project.

## eldik_feature

This brick helps you quickly generate a new feature within your project. It automatically creates the necessary basic files and folder structure for you.
for example:

```bash
example/
  data/
    example_service.dart
    example_service.g.dart
    remote_example_provider.dart
  domain/
    example_provider.dart
    example_repository.dart
  models/
    example_model.dart
    example_model.g.dart
  ui/
    bloc/
      example_bloc.dart
      example_bloc.freezed.dart
      example_event.dart
      example_state.dart
    view/
      example_route.dart
      example_view.dart
```

### Installation

To add the `eldik_feature` brick to your project, follow these steps:

1.  Add the following code to your project's `mason.yaml` file, located at the root of your project:

```yaml
bricks:
  eldik_feature:
    git:
      url: [https://github.com/Eldar2021/eldik_bricks.git](https://github.com/Eldar2021/eldik_bricks.git)
      path: bricks/eldik_feature
```

2.  Open your terminal, navigate to the root directory of your project, and run the following command to install the bricks:

```bash
mason get
```

### Usage

To generate a new feature using the `eldik_feature` brick, run the following command:

```bash
mason make eldik_feature
```

This command will prompt you to enter a name for your feature. For example, if you enter `user_profile`, the necessary files and folders will be created based on this name.

### Upgrading Mason Bricks

To update your existing mason bricks, you can use the following command:

```bash
mason upgrade
```

This command will download the latest versions of all the bricks listed in your `mason.yaml` file.
