import subprocess


def get_motivational_word() -> str:
    proc = subprocess.run(["cowsay", "OK!"], capture_output=True)
    if proc.returncode != 0:
        raise SystemError(f"Process returned {proc.stderr.decode()}")
    return proc.stdout.decode()
