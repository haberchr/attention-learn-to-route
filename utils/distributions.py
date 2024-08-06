import numpy as np


def gaussian_mixture_batch(batch_size, tsp_size, cdist):
    # Generate from Gaussian mixture, taken from Zhang et. al (2022)
    points = []
    for i in range(batch_size):
        nc = np.random.randint(3, 7)
        nums = np.random.multinomial(tsp_size, np.ones(nc)/nc)
        xy = []
        for num in nums:
            center = np.random.uniform(0, cdist, size=(1,2))
            nxy = np.random.multivariate_normal(
                mean=center.squeeze(),
                cov=np.eye(2,2),
                size=(num,)
            )
            xy.extend(nxy)
        points.append(np.array(xy))
    points = np.array(points)
    
    # Translate and scale points to fit inside unit square
    points -= np.min(points, axis=1, keepdims=True)
    points /= np.max(
        np.max(
            points, axis=1, keepdims=True
        ), axis=2, keepdims=True
    )
    
    return points

def poly_batch(batch_size, tsp_size, n_corners, noise=0.05):
    # Preprocess and safety
    assert n_corners >= 3, "Number of corners must be at least 3"
    edge_points = tsp_size // (2 * n_corners)

    # Generate points
    points = np.zeros((batch_size, tsp_size, 2))
    for i in range(batch_size):
        degs = np.linspace(0, 2 * np.pi, n_corners, endpoint=False)
        degs += np.random.uniform(0, 2 * np.pi)
        corner_x = np.cos(degs)
        corner_y = np.sin(degs)
        for j in range(n_corners):
            points[i, j*edge_points:(j+1)*edge_points, 0] = np.linspace(
                corner_x[j], corner_x[(j+1)%n_corners], edge_points, endpoint=False
            )
            points[i, j*edge_points:(j+1)*edge_points, 1] = np.linspace(
                corner_y[j], corner_y[(j+1)%n_corners], edge_points, endpoint=False
            )
        for j in range(n_corners):
            points[
                i, n_corners*edge_points + j*edge_points:(n_corners+1)*edge_points + j*edge_points, 0
            ] = np.linspace(corner_x[j], 0, edge_points, endpoint=False)
            points[
                i, n_corners*edge_points + j*edge_points:(n_corners+1)*edge_points + j*edge_points, 1
            ] = np.linspace(corner_y[j], 0, edge_points, endpoint=False)
    points += np.random.normal(0, noise, points.shape)
    
    # Translate and scale points to fit inside unit square
    points -= np.min(points, axis=1, keepdims=True)
    points /= np.max(
        np.max(
            points, axis=1, keepdims=True
        ), axis=2, keepdims=True
    )
    
    return points
