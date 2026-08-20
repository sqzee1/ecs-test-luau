export type PlayerTemplate = {}

type ReplicatedState = {
    buf: buffer,
    variants: { { any } },
}

export type Collect = () -> (number, ReplicatedState)
