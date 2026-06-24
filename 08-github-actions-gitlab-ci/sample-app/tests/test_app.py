from app import create_app


def test_index_returns_message_and_version():
    client = create_app().test_client()

    response = client.get("/")

    assert response.status_code == 200
    payload = response.get_json()
    assert payload["message"] == "CI platform sample app"
    assert "version" in payload


def test_healthz_returns_ok():
    client = create_app().test_client()

    response = client.get("/healthz")

    assert response.status_code == 200
    assert response.get_json()["status"] == "ok"
