import Foundation

struct Team {
    let id:Int
    var points:Int
    var group:Int {get {if id < 6 {return 0} else if id > 9 {return 2} else {return 1} }}
}

var thirds = [0,0,0]
var fourths = [0,0,0]
var results = [(0,3),(1,1),(3,0)]
var matches = [(0,1),(2,3),(4,5),(0,2),(1,5),(3,4),(0,3),(1,4),(2,5),(6,7), (8,9), (6,8), (7,9), (6,9), (7,8), (10,11), (12,13), (10,12), (11,13), (10,13), (11,12)]
var advance:Array<Int> = Array(repeating: 0, count: 14)
for _ in 0..<100_000 {
    var points:Array<Team> = (0...13).map{Team(id: $0, points: 0)}
    for (i,j) in matches {
        let (a,b) = results.randomElement()!
        points[i].points += a
        points[j].points += b
    }
    let groupa = points[0...5].sorted{$0.points > $1.points}
        advance[groupa[0].id] += 1
        advance[groupa[1].id] += 1
    let groupb = points[6...9].sorted{$0.points > $1.points}
    advance[groupb[0].id] += 1
    advance[groupb[1].id] += 1
    let groupc = points[10...13].sorted{$0.points > $1.points}
    advance[groupc[0].id] += 1
    advance[groupc[1].id] += 1
    let ids = [groupa[0].id, groupa[1].id, groupb[0].id, groupb[1].id, groupc[0].id, groupc[1].id]
    var remainder = points.filter{!ids.contains($0.id)}
    remainder = remainder.sorted{$0.points > $1.points}
    if remainder[0].points > remainder[1].points {
        advance[remainder[0].id] += 1
		thirds[remainder[0].group] += 1
        if remainder[1].points > remainder[2].points {
            advance[remainder[1].id] += 1
			fourths[remainder[1].group] += 1
        } else {
            let p = remainder[1].points
            remainder = remainder.filter{$0.points == p}
			let team = remainder.randomElement()!
            advance[team.id] += 1
			fourths[team.group] += 1
        }
    } else if remainder[0].points > remainder[2].points {
        advance[remainder[0].id] += 1
		thirds[remainder[0].group]+=1
        advance[remainder[1].id] += 1
		fourths[remainder[0].group]+=1
    } else {
        let p = remainder[0].points
        remainder = remainder.filter({$0.points == p})
        let three = remainder.randomElement()!
        advance[three.id] += 1
        thirds[three.group] += 1
        remainder = remainder.filter({$0.id != three.id})
        let four = remainder.randomElement()!
        advance[four.id] += 1
        fourths[four.group] += 1
    }
}
print( advance.map{"\($0/1000)%"})
print("Third place goes to Group A \(thirds[0]/1000)% of the time")
print("Third place goes to Group B \(thirds[1]/1000)% of the time")
print("Third place goes to Group C \(thirds[2]/1000)% of the time")
print()
print("Fourth place goes to Group A \(fourths[0]/1000)% of the time")
print("Fourth place goes to Group B \(fourths[1]/1000)% of the time")
print("Fourth place goes to Group C \(fourths[2]/1000)% of the time")

