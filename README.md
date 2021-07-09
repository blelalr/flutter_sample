# flutter_sample

## Package

```
Lib 
  |_api - network request
  |_bloc - bloc pattern by feature
      |_dialog
      |_theme
      |_...
  |_component - custom component
      {what is this}_{description}
      button_large
      button_small
  |_model 
  |_navigation 
  |_page 
    |_{which page}
      |_{page_name}_page
        /{frame_name}_frame
          /{view_name}_view
    |_home
    |_profile
    |_...
  |_res  
    app_colors
    app_fonts
    app_themes
    app_strings
    ...
     
```

## Theme
* primaryColor => background
* iconTheme.color => icon, text
* hintColor => hint text, outlined
* colorScheme
  * colorScheme.primary => orange theme color
  * colorScheme.onPrimary => on orange theme color item
  * colorScheme.secondary => green theme color
  * colorScheme.onSecondary => on green theme color
* custom
```
  final themeBloc = context.watch<ThemeCubit>();
  ..
  color: themeBloc.isDark? Color.dark: Color.light

```
