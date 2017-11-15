# BT
"BehaviorTree for nodejs"
MMO를 구현하던, Single Adventure Leveling을 구현하던, 
게임에서 중요한 요소는 NPC의 특성 정의라 생각한다.
현재 수순에서 FSM, ... H ... 등 NPC 모델링에서 행동지침을 정의하는 방법 중,
BT는 Maintenance라는 관점에서 모듈화, 재사용성을 확보하기 위한 포지션을 차지하고 있지만,
BT를 포함하여 프로잭트의 결과물의 관점에서 복잡도를 요구하지 않는다면 크게 발전시킬 필요를 느끼지는 않는다.

하지만, 협업 도구로써의 BT는 굉장한 팀 시너지를 생산하는 도구일 수 있다.
FSM 등 기존 도구는 프로그램으로 작성되는 일련의 과정을 통해 복잡도가 높아진 상태에서,
더이상 기획 단계와 구현단계는 협업보다는 이슈 전달과정일 수 밖에 없게 된다.

이를 보정하기 위한 방안으로 BT의 Modularity, Property는 좋은 대화의 수단이 된다.

블록이 쏟아져내려오는 퍼즐 게임이 있다.
블록을 생산해내는 BossNPC는 무슨 기준으로 블록을 던지고 있는 것일까?
또한 그의 생산 기준을 어떤 문건으로 타인에게 설명할 것인가?
반응형 모델이라면 어떤 그래프를 청자에게 전달할 것인가?
얼마나 많은 문서를 전달해야 할 것인가?
혹자는 개인의 문법책을 주면서, 또 어떠한 오타마타를 제공하려 할지 모른다.

이제 그저 적용된 BehaviorTree의 1 Depth 만으로 속성을 예측하고,
TreeTraverse 만으로 NPC들의 행동을 예측하자.

# BlackBoard of actor
UE4에서 말하는 BlackBoard는 Behavior를 결정하기 위해 참조하는 데이터의 집합을 말한다.
변수를 지정하고, 해당 변수와 액터를 연결한다.

AI 모듈과 액터를 분리하는 좋은 수단이지만, 
Sensor가 읽거나, 받아들이는 기본 패턴으로 정의될 수도 있으므로,
Sensor의 유무나, EventEmitter, delegator, getter 등으로 단계를 축약할 수도 있다.

# Node
- BlackBoard: 액터 및 환경의 상태를 저장하는 공간이다.
- Sensor: Actor에서 발생하는 이벤트를 BlackBoard에 기록하는 정의자이자, Node가 BlackBoard를 참조하는 기준이된다.
- Selector: Node의 유형으로써 Decision을 통해, ChildNode로 행동을 결정하는 주체이다.
- Sequencer: Node의 유형으로써 ChildNodes의 수행 순서를 풀어내는 주체이다.
- Behavior: 최종 결정 단계로써, Tick에서의 현재 행위를 지정한다.

# Tick Processing
Tick은 이전 Behavior에서 시작된다. 
최초는 Root Node에서 첫번째 노드로 지정하는 IDLE Node의 Sensor에 의해 아무런 이벤트가 없는 IDLE Behavior이다.

# Designing BehaviorTree
