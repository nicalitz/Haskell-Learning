addVectors2D :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors2D (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

addVectors3D :: (Num a) => (a, a, a) -> (a, a, a) -> (a, a, a)
addVectors3D (x1, y1, z1) (x2, y2, z2) = (x1 + x2, y1 + y2, z1 + z2)

first :: (Num a) => (a, b, c) -> a
first (x, _, _)  = x

second :: (Num a) => (a, b, c) -> b
second (_, y, _)  = y

third :: (Num a) => (a, b, c) -> c
third (_, _, z)  = z
