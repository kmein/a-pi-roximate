extern crate rand;

use rand::{Rng, thread_rng};

const RADIUS: f64 = 20.0;

struct Point { x: f64, y: f64 }

impl Point {
    fn dist(&self) -> f64 {
        (self.x.powi(2) + self.y.powi(2)).sqrt()
    }

    fn random() -> Self {
        Point {
            x: thread_rng().next_f64() * RADIUS,
            y: thread_rng().next_f64() * RADIUS,
        }
    }

    fn randoms(count: usize) -> Vec<Self> {
        let mut result = Vec::new();
        for _ in 1..count {
            result.push(Self::random());
        }
        result
    }
}

fn approximate(count: usize) -> f64 {
    let in_circle_count = Point::randoms(count).iter().filter(|&v| v.dist() <= RADIUS).count();
    4.0 * (in_circle_count as f64 / count as f64)
}

fn main() {
    for count in 1..100_000 {
        println!("{:6} {}", count, approximate(count));
    }
}
