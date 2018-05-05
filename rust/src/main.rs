extern crate num_complex;
extern crate rand;
use num_complex::Complex;
use rand::{thread_rng, Rng};

fn random_points(count: usize) -> Vec<Complex<f64>> {
    let mut result = Vec::new();
    for _ in 1..count {
        result.push(Complex::new(
            thread_rng().next_f64(),
            thread_rng().next_f64(),
        ));
    }
    result
}

fn approximate(count: usize) -> f64 {
    let in_circle_count = random_points(count)
        .iter()
        .filter(|&v| v.norm_sqr().sqrt() <= 1.0)
        .count();
    4.0 * (in_circle_count as f64 / count as f64)
}

fn main() {
    for count in 1..100_000 {
        println!("{:6} {}", count, approximate(count));
    }
}
