import UIKit

/*
 1. 팩토리 패턴(Factory Method Pattern)이란?
 -> 인스턴스 생성을 하위 클래스가 하도록 처리하는 패턴.
 인스턴스를 생성하기 위한 인터페이스(프로토콜)를 정의하지만 어떤 클래스의 인스턴스를 생성할지에 대한 결정은 하위 클래스에 맡긴다.
 즉, 부모 클래스는 자식 클래스가 어떤 객체를 생성하는지 몰라도 된다.
 
 ex) 미디어 플레이어 어플을 만든다고 가정한다.
 1. 음악, 동영상 재생 기능을 무지성으로 때려박는다?
 -> 새로운 기능이 추가될때마다 소스코드 전체를 수정해야함.
 
 2. 각 기능을 사용할때마다 필요한 메소드를 호출한다 -> 팩토리
 초기에 음악 재생만 가능하게 한 상황에서 새로운 기능을 추가하더라도 팩토리 부분에 메소드를 추가하면 된다.
 다른 컨텐츠를 취급하더라도 미디어를 재생한다는 궁극적인 기능은 같기 때문에 동일한 인터페이스(프로토콜)를 사용해야함.
 
 군수공장 -> 장갑차, 탱크와 같은 기갑 차량을 제작한다(프로토콜): 군수 공장에서 아쎄이를 훈련시켜서 내보내면 안됨.
 
 초기에는 75mm 셔먼만 내보내는 1번 라인밖에 없음. 근데 독일 전차들 장갑을 뚫을수가 없어서 76mm 셔먼이 필요함.
 * 1번 라인 - 75mm 셔먼
 
 새로운 공장을 짓거나 뜯어고치지 말고 옆에 76mm 셔먼을 생산하는 라인을 추가함
 * 1번 라인 - 75mm 셔먼
 * 2번 라인 - 76mm 셔먼
 
 갑자기 영국놈들이 75mm 못 써먹겠다면서 16파운드 포를 얹어먹으려고 함.
 * 1번 라인 - 75mm 셔먼
 * 2번 라인 - 76mm 셔먼
 * 3번 라인 - 셔먼 파이어플라이
 
 A: 물량 채우게 기본 75mm 짜리 보내주세요 -> 1번 라인 호출
 B: 판터 정면을 못 뚫어요 좀 쎈거 줘요 -> 2번 라인 호출
 C: 양키들 포 약해서 못 써먹겠다 더 쎈거 내놔 -> 3번 라인 호출
 */

protocol Tank {
    func line()
    func gun()
    func attack()
}

enum kindOfTank {
    case basic, advanced, firefly
}

class basic: Tank {
    func line() {
        print("75mm sherman moving")
    }
    func gun() {
        print("using 75mm gun")
    }
    func attack() {
        print("cannot penetrate panther")
    }
}

class advanced: Tank {
    func line() {
        print("76mm sherman roll out")
    }
    func gun() {
        print("using 76mm gun")
    }
    func attack() {
        print("effective on panther, but still cannot penetrate tiger")
    }
}

class firefly: Tank {
    func line() {
        print("move up, lads")
    }
    func gun() {
        print("using 16pounder")
    }
    func attack() {
        print("effective on tiger")
    }
}

class TankFactory {
    func makeTank(_ kind: kindOfTank) -> Tank {
        switch kind {
        case .basic:
            return basic()
        case .advanced:
            return advanced()
        case .firefly:
            return firefly()
        }
    }
}

func main() {
    let tankFactory = TankFactory()
    let tank1 = tankFactory.makeTank(.basic)
    tank1.line()
    tank1.gun()
    tank1.attack()
    print("")
    let tank2 = tankFactory.makeTank(.advanced)
    tank2.line()
    tank2.gun()
    tank2.attack()
    print("")
    let tank3 = tankFactory.makeTank(.firefly)
    tank3.line()
    tank3.gun()
    tank3.attack()
}

main()
