import hilog from '@ohos.hilog'

const LOGGER_PREFIX: string = 'WanHarmony'

class Log {
  private domain: number
  private prefix: string
  private format: string = '%{public}s, %{public}s'

  constructor(prefix: string = '', domain: number = 0xFF00) {
    this.prefix = prefix
    this.domain = domain
  }

  debug(...args: string[]): void {
    hilog.debug(this.domain, this.prefix, this.format, args)
  }

  info(...args: string[]): void {
    hilog.info(this.domain, this.prefix, this.format, args)
  }

  warn(...args: string[]): void {
    hilog.warn(this.domain, this.prefix, this.format, args)
  }

  error(...args: string[]): void {
    hilog.error(this.domain, this.prefix, this.format, args)
  }
}

export default new Log(LOGGER_PREFIX, 0xFF02)