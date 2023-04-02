import 'package:equatable/equatable.dart';

class PlayState extends Equatable{
  final String value;
  const PlayState(this.value);
  
  @override
  List<Object?> get props => [value];

  //Here without implimenting Equatable. You can also use equatable mixin
  // @override
  // bool operator==(Object other) {
  //   if (identical(this, other)) return true;
  //   return other is PlayState && value==other.value;
  // }
  
  // @override
  // int get hashCode => value.hashCode;
  
}
