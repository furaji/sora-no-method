package main

import "fmt"

type 天体 struct {}

func (p *天体) メソッド() {
      fmt.Printf("天体のメソッド")
}

func main() {
      var 天体 天体
      天体.メソッド()
}
