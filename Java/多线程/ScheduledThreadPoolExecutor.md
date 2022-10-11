主要用于定时任务。



- ScheduledExecutorService#scheduleAtFixedRate() 指的是“以固定的频率”执行，period（周期）指的是两次成功执行之间的时间。上一个任务开始的时间计时，一个period后，检测上一个任务是否执行完毕，如果上一个任务执行完毕，则当前任务立即执行，如果上一个任务没有执行完毕，则需要等上一个任务执行完毕后立即执行。

  因此，往往需要加超时。

- ScheduledExecutorService#scheduleWithFixedDelay() 指的是“以固定的延时”执行，delay（延时）指的是一次执行终止和下一次执行开始之间的延迟。