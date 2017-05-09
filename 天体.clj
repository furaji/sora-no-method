(defrecord 天体 [])

(defmulti メソッド identity)

(defmethod メソッド 天体 [_]
  (println "天体のメソッド"))

(-> 天体 メソッド)
