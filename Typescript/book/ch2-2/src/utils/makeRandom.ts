let MAX_AGE = 100

export function makePersonRandomNumber(max: number = MAX_AGE): number {
    return Math.ceil((Math.random() * max))
}