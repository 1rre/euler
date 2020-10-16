package re._1r.euler.problems

object _90 {


  def result = {
    (1 to 9).foreach(i => {
      (i to 9).foreach(j => {
        (j to 9).foreach(k => {
          (k to 9).foreach(l => {
            (l to 9).foreach(m => {
              (m to 9).foreach(n => {
                println((i,j,k,l,m,n))
              })
            })
          })
        })
      })
    })
  }
}